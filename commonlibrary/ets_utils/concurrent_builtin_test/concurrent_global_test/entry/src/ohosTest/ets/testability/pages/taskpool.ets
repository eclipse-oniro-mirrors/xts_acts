@Concurrent
export function test_Global_test_001() {
  let result = encodeURI(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
    'GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
  return result
}

@Concurrent
export function test_Global_test_002() {
  let result = encodeURI("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
  return result;
}

@Concurrent
export function test_Global_test_003() {
  let result = encodeURI('\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b');
  return result;
}

@Concurrent
export function test_Global_test_004() {
  let result = encodeURI('💇 === \ud83d\udc87');
  return result;
}

@Concurrent
export function test_Global_test_005() {
  let result =
    decodeURI("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
  return result;
}

@Concurrent
export function test_Global_test_006() {
  let result =
    decodeURI("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
  return result;
}

@Concurrent
export function test_Global_test_007() {
  let result =
    decodeURI('%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb');
  return result;
}

@Concurrent
export function test_Global_test_008() {
  let result =
    decodeURI('%F0%9F%92%87%20===%20%F0%9F%92%87');
  return result;
}

@Concurrent
export function test_Global_test_009() {
  let result = encodeURIComponent(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
    'GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
  return result;
}

@Concurrent
export function test_Global_test_010() {
  let result = encodeURIComponent("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
  return result;
}

@Concurrent
export function test_Global_test_011() {
  let result = encodeURIComponent('\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b');
  return result;
}

@Concurrent
export function test_Global_test_012() {
  let result = encodeURIComponent('💇 === \ud83d\udc87');
  return result;
}

@Concurrent
export function test_Global_test_013() {
  let result =
    decodeURIComponent("%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
  return result;
}

@Concurrent
export function test_Global_test_014() {
  let result =
    decodeURIComponent("!!%22%22##$$%25%25&&''(())**++,,--..//::;;%3C%3C==%3E%3E??@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~");
  return result;
}

@Concurrent
export function test_Global_test_015() {
  let result =
    decodeURIComponent('%F0%9F%92%87%20===%20%F0%9F%92%87');
  return result;
}

@Concurrent
export function test_Global_test_016() {
  let result =
    decodeURIComponent('%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80$%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb');
  return result;
}

@Concurrent
export function test_Global_test_017() {
  let result =
    decodeURIComponent("%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~");
  return result;
}

@Concurrent
export function test_Global_test_018() {
  let result = decodeURIComponent(
    "!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F%2F%3A%3A" +
      '%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%' +
      '60%7B%7B%7C%7C%7D%7D~~'
  );
  return result;
}

@Concurrent
export function test_Global_test_019() {
  let result =
    decodeURIComponent('%5C%5Cb%5C0%5C%F0%9F%92%87%5C%E5%BC%80%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb');
  return result;
}

@Concurrent
export function test_Global_test_020() {
  let result =
    decodeURIComponent('%F0%9F%92%87%20%3D%3D%3D%20%F0%9F%92%87');
  return result;
}

@Concurrent
export function test_Global_test_021() {
  let result = escape(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
    'GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
  return result;
}

@Concurrent
export function test_Global_test_022() {
  let result = escape("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
  return result;
}

@Concurrent
export function test_Global_test_023() {
  let result = escape('\\\\b\\0\\💇\\开\x24\\v\\t\\r\\n\\f\\b');
  return result;
}

@Concurrent
export function test_Global_test_024() {
  let result = escape('💇 === \ud83d\udc87');
  return result;
}

@Concurrent
export function test_Global_test_025() {
  let result = isFinite(123);
  return result;
}

@Concurrent
export function test_Global_test_026() {
  let result = isFinite(3.14);
  return result;
}

@Concurrent
export function test_Global_test_027() {
  let result = isFinite(456);
  return result;
}

@Concurrent
export function test_Global_test_028() {
  let result = isFinite(Infinity);
  return result;
}

@Concurrent
export function test_Global_test_029() {
  let result = isFinite(-Infinity);
  return result;
}

@Concurrent
export function test_Global_test_030() {
  let result = isFinite(NaN);
  return result;
}

@Concurrent
export function test_Global_test_031() {
  let result = isFinite(Number.EPSILON);
  return result;
}

@Concurrent
export function test_Global_test_032() {
  let result = isFinite(Number.MAX_VALUE);
  return result;
}

@Concurrent
export function test_Global_test_033() {
  let result = isFinite(Number.MIN_VALUE);
  return result;
}

@Concurrent
export function test_Global_test_034() {
  let result = unescape('%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A' +
    '%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E');
  return result;
}

@Concurrent
export function test_Global_test_035() {
  let result = unescape('%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**++%2C%2C--.' +
    './/%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F@@%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E');
  return result;
}

@Concurrent
export function test_Global_test_036() {
  let result = unescape('%5C%5Cb%5C0%5C%uD83D%uDC87%5C%u5F00%24%5Cv%5Ct%5Cr%5Cn%5Cf%5Cb');
  return result;
}

@Concurrent
export function test_Global_test_037() {
  let result = unescape('%uD83D%uDC87%20%3D%3D%3D%20%uD83D%uDC87');
  return result;
}

@Concurrent
export function test_Global_test_038() {
  let result = isNaN(123);
  return result;
}

@Concurrent
export function test_Global_test_039() {
  let result = isNaN(-45.6);
  return result;
}

@Concurrent
export function test_Global_test_040() {
  let result = isNaN(0);
  return result;
}

@Concurrent
export function test_Global_test_041() {
  let result = isNaN(Infinity);
  return result;
}

@Concurrent
export function test_Global_test_042() {
  let result = isNaN(-Infinity);
  return result;
}

@Concurrent
export function test_Global_test_043() {
  let result = isNaN(Number.MAX_VALUE);
  return result;
}

@Concurrent
export function test_Global_test_044() {
  let result = isNaN(Number.MIN_VALUE);
  return result;
}

@Concurrent
export function test_Global_test_045() {
  let result = isNaN(Number.EPSILON);
  return result;
}

@Concurrent
export function test_Global_test_046() {
  let result = isNaN(Number.NEGATIVE_INFINITY);
  return result;
}

@Concurrent
export function test_Global_test_047() {
  let result = isNaN(Number.POSITIVE_INFINITY);
  return result;
}

@Concurrent
export function test_Global_test_048() {
  let result = isNaN(Number.NaN);
  return result;
}

@Concurrent
export function test_Global_test_049() {
  let result = isNaN(NaN);
  return result;
}

@Concurrent
export function test_Global_test_050() {
  return encodeURI('\ud83d');
}

@Concurrent
export function test_Global_test_051() {
  return encodeURIComponent('\ud83d');
}
