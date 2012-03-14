<?php
/**
 * source: http://www.sitepoint.com/index-of-php-tokens-for-emacs-and-beyond/
 */

if (!defined('T_UNSPECIFIED_STRING')) {
  define('T_UNSPECIFIED_STRING', -1);
}
function token_get_all_improved($data) {
  $tokens = array();
  $line = 1;
  $col = 0;
  $level = 0;
  $scope_level = null;
  $in_scope = false;
  foreach (token_get_all($data) as $token) {
    if (is_array($token)) {
      list ($token, $text) = $token;
    } else if (is_string($token)) {
      $text = $token;
      $token = T_UNSPECIFIED_STRING;
    }
    if ($token === T_CURLY_OPEN || $token === T_DOLLAR_OPEN_CURLY_BRACES || $text === '{') {
      ++$level;
      if (is_null($scope_level)) {
        $scope_level = $level;
      }
    } else if ($text == '}') {
      --$level;
      if ($in_scope && $level < $scope_level) {
        $in_scope = false;
      }
    }
    $tmp = $text;
    $num_new_lines = substr_count($tmp, "\n");
    if (1 <= $num_new_lines) {
      $line += $num_new_lines;
      $col =  1;
      $tmp = substr($tmp, strrpos($tmp, "\n") + 1);
      if ($tmp === false) {
        $tmp = '';
      }
    }
    $col += strlen($tmp);
    if ($token === T_INTERFACE || $token === T_CLASS) {
      $in_scope = true;
      $scope_level = null;
    }
    $xtoken = new StdClass();
    $xtoken->type = $token;
    $xtoken->text = $text;
    $xtoken->line = $line;
    $xtoken->col = $col;
    $xtoken->blockLevel = $level;
    $xtoken->isClassScope = $in_scope && !is_null($scope_level);
    $tokens[] = $xtoken;
  }
  return $tokens;
}
function docblock_excerpt($str) {
  if (preg_match('~\*{2}[\s\n*]+(.*)~', trim($str, '/'), $matches)) {
    return $matches[1];
  }
}
function transform_tokens_to_list($tokens) {
  $buffer = null;
  $docblock = null;
  $results = array();
  $access = '+';
  foreach ($tokens as $token) {
    switch ($token->type) {
    case T_PUBLIC:
      $access = '+';
      break;
    case T_PRIVATE:
      $access = '-';
      break;
    case T_PROTECTED:
      $access = '#';
      break;
    case T_DOC_COMMENT:
      $docblock = $token->text;
      break;
    case T_INTERFACE:
    case T_CLASS:
    case T_FUNCTION:
      $buffer = $token;
      $buffer->access = $access;
      $access = '+';
      break;
    case T_STRING:
      if (!is_null($buffer)) {
        $buffer->isMember = $buffer->isClassScope || ($buffer->type != T_FUNCTION);
        $buffer->docblock = $docblock;
        $buffer->name = $token->text;
        $results[] = $buffer;
        $buffer = null;
        $docblock = null;
      }
      break;
    }
  }
  return $results;
}
function list_to_table($results) {
  $view = array();
  $last = null;
  foreach ($results as $token) {
    if ($last && ((!$token->isMember && $last->isMember) || (in_array($token->type, array(T_INTERFACE, T_CLASS))))) {
      $view[] = array('', '', '', '', '');
    }
    $last = $token;
    $view[] = array(
      $token->line,
      $token->isMember ? $token->access : '',
      strtolower(str_replace('T_', '', token_name($token->type))),
      $token->name,
      docblock_excerpt($token->docblock)
    );
  }
  return $view;
}
function format_table($map) {
  $out = array();
  $column_widths = array_fill(0, count($map[0]), 0);
  foreach ($map as $row) {
    foreach ($row as $num => $col) {
      $column_widths[$num] = max($column_widths[$num], strlen($col));
    }
  }
  foreach ($map as $row) {
    $line = '';
    foreach ($row as $num => $col) {
      $line .= str_pad($col, $column_widths[$num] + 2);
    }
    $out[] = trim($line);
  }
  return implode("\n", $out);
}
print(
  format_table(
    list_to_table(
      transform_tokens_to_list(
        token_get_all_improved(
          file_get_contents(
            isset($argv[1]) ? $argv[1] : 'php://stdin')))))
  . "\n");