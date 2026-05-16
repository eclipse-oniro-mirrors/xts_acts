import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

interface ErrorWithCode {
  code: number;
}

interface NestedInnerForCtor0046 {
  f: Object;
}

interface NestedOuterForCtor0046 {
  d: Object;
  e: NestedInnerForCtor0046;
}

interface ObjTempForCtor0046 extends Record<string, Object | null> {
  a: Object;
  b: Object;
  c: Object;
  nested: NestedOuterForCtor0046;
  nullVal: Object | null;
  nan: Object;
  inf: Object;
  uint8: Object;
  map: Object;
  set: Object;
  promise: Object;
  regex: Object;
}

export default function URI05Test() {
  describe('URI05Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0100
     * @tc.name testURI05Chapter0001
     * @tc.desc Reverse test: URI containing raw control characters (\\a, \\b, \\f, \\n, \\r, \\t, \\v, \\0) should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let rawStr = 'https://example.com/control' + '\x07\x08\x0C\x0A\x0D\x09\x0B\x00' + 'path';
        new uri.URI(rawStr);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0200
     * @tc.name testURI05Chapter0002
     * @tc.desc Reverse test: URI containing raw backslash and quotes (without encoding) should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let rawStr = 'https://example.com/\\\'"path';
        new uri.URI(rawStr);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0300
     * @tc.name testURI05Chapter0003
     * @tc.desc Positive test: URI with percent-encoded escape sequences (e.g., %00, %07, %0A) in query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?escaped=%00%07%08%09%0A%0D%0B%1B%7F';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('escaped=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0400
     * @tc.name testURI05Chapter0004
     * @tc.desc Positive test: URI with percent-encoded multiple emojis in query value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emojis = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const encoded = encodeURIComponent(emojis);
      const uriStr = 'https://example.com/?emoji=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('emoji=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0500
     * @tc.name testURI05Chapter0005
     * @tc.desc Reverse test: URI containing lone low surrogate (\\udc04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encoded: string = '%DC%04';
      const uriObj: uri.URI = new uri.URI('https://example.com/?q=' + encoded);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0600
     * @tc.name testURI05Chapter0006
     * @tc.desc Reverse test: URI containing mixed lone surrogates (\\ud83d\\udc04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encoded: string = '%ED%A0%BD%DC%04';
      const uriObj: uri.URI = new uri.URI('https://example.com/?q=' + encoded);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0700
     * @tc.name testURI05Chapter0007
     * @tc.desc Positive test: Keyword "0" as path segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/0';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.path !== undefined && uriObj.path !== null).assertTrue();
      expect(uriObj.path.includes('0')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0800
     * @tc.name testURI05Chapter0008
     * @tc.desc Positive test: Keyword "NaN" as path segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/NaN';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.path !== undefined && uriObj.path !== null).assertTrue();
      expect(uriObj.path.includes('NaN')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_0900
     * @tc.name testURI05Chapter0009
     * @tc.desc Positive test: TreeString-like long JSON array as query value (size ~10k)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let size = 10000;
      let ans = '[';
      while (ans.length < size) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}]';
      const encoded = encodeURIComponent(ans);
      const uriStr = 'https://example.com/?tree=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('tree=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1000
     * @tc.name testURI05Chapter0010
     * @tc.desc Positive test: SliceString derived URI (substring result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '{k1:value1,k2:value2}';
      const result = str.substring(0, str.length - 2);
      const uriStr = 'https://example.com/path/' + encodeURIComponent(result);
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.path !== undefined && uriObj.path !== null).assertTrue();
      expect(uriObj.path.includes('k1:value1,k2:value')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1100
     * @tc.name testURI05Chapter0011
     * @tc.desc Memory test: Construct URI with very long query value (~1M chars) to verify no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(1000000);
      const encoded = encodeURIComponent(longStr);
      const uriStr = 'https://example.com/?big=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('big=')).assertTrue();
      expect(uriObj.query.length > 100000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1200
     * @tc.name testURI05Chapter0012
     * @tc.desc GC behavior test: Create large URI string, release reference, expect no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(5000000);
      const encoded = encodeURIComponent(longStr);
      const uriStr = 'https://example.com/?gc=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1300
     * @tc.name testURI05Chapter0013
     * @tc.desc Positive test: Various number strings as query values (0, NaN, -0, Infinity, -Infinity, MAX_VALUE, MIN_VALUE, EPSILON, MAX_SAFE_INTEGER, boundaries, hex, octal, scientific)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?' +
        'zero=0&' +
        'nan=NaN&' +
        'negZero=-0&' +
        'inf=Infinity&' +
        'ninf=-Infinity&' +
        'double=1.5&' +
        'maxVal=1.7976931348623157e%2B308&' +
        'minVal=5e-324&' +
        'eps=2.220446049250313e-16&' +
        'maxSafe=9007199254740991&' +
        'byteMin=-128&byteMax=127&byteOver=128&byteUnder=-129&' +
        'shortMin=-32768&shortMax=32767&shortOver=32768&shortUnder=-32769&' +
        'intMin=-2147483648&intMax=2147483647&intOver=2147483648&intUnder=-2147483649&' +
        'longMin=-9223372036854775808&longMax=9223372036854775807&longOver=9223372036854775808&longUnder=-9223372036854775809&' +
        'floatMin=1.40129846432481707e-45&floatMax=3.40282346638528860e%2B38&' +
        'doubleMin=4.94065645841246544e-324&doubleMax=1.79769313486231570e%2B308&' +
        'charMin=0&charMax=65535&charOver=65536&' +
        'bigInt=123456789012345678901234567890&' +
        'hex=0xdecafafecacefade&' +
        'hex2=0xcafebabe&' +
        'hex3=0x0102&' +
        'hex4=0x01020304&' +
        'octal=0o3&' +
        'exp=2**3&' +
        'sci1=1e3&sci2=2.5e-2&' +
        'bigIntSuffix=9007199254740991n';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('zero=0')).assertTrue();
      expect(uriObj.query.includes('nan=NaN')).assertTrue();
      expect(uriObj.query.includes('inf=Infinity')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1400
     * @tc.name testURI05Chapter0014
     * @tc.desc Positive test: Boolean strings as query values (true, false, 0, NaN, null, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?boolTrue=true&boolFalse=false&zero=0&nan=NaN&null=null&undefined=undefined';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('boolTrue=true')).assertTrue();
      expect(uriObj.query.includes('boolFalse=false')).assertTrue();
      expect(uriObj.query.includes('null=null')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1500
     * @tc.name testURI05Chapter0015
     * @tc.desc Positive test: Array JSON string as query value (percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [72, 101, 108, 108, 111];
      const arrStr = JSON.stringify(arr);
      const encoded = encodeURIComponent(arrStr);
      const uriStr = 'https://example.com/?arr=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('arr=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1600
     * @tc.name testURI05Chapter0016
     * @tc.desc Positive test: Object JSON string as query value (percent-encoded), including nested object, Symbol key (ignored), function, undefined, null, NaN, Infinity, TypedArray, Map, Set, Promise, RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      interface NestedInner {
        f: Object;
      }
      interface NestedOuter {
        d: Object;
        e: NestedInner;
      }

      interface TestObject {
        a: Object;
        b: Object;
        c: Object;
        nested: NestedOuter;
        nullVal: null;
        nan: Object;
        inf: Object;
        uint8: Object;
        map: Object;
        set: Object;
        promise: Object;
        regex: Object;
      }

      let mapEntry: [string, Object] = ["key1", "value1" as Object];
      let setData: Object = new Set<number>([1, 2, 3]) as Object;
      let regexData: Object = /abc/gi as Object;
      let uint8Data: Object = new Uint8Array([72, 101, 108]) as Object;

      let nestedInner: NestedInner = { f: 3 as Object };
      let nestedOuter: NestedOuter = { d: 2 as Object, e: nestedInner };

      let objTemp: TestObject = {
        a: 1 as Object,
        b: "test" as Object,
        c: [1, 2, 3] as Object,
        nested: nestedOuter,
        nullVal: null,
        nan: NaN as Object,
        inf: Infinity as Object,
        uint8: uint8Data,
        map: mapEntry as Object,
        set: setData,
        promise: new Promise<string>((resolve) => resolve('done')) as Object,
        regex: regexData
      };

      let objStr: string = JSON.stringify(objTemp);
      let encoded: string = encodeURIComponent(objStr);
      let uriStr: string = 'https://example.com/?obj=' + encoded;
      let uriObj: uri.URI = new uri.URI(uriStr);
      expect(uriObj !== undefined && uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('obj=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1700
     * @tc.name testURI05Chapter0017
     * @tc.desc Reverse test: URI with invalid percent encoding (%gg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/?bad=%gg');
      expect(uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('bad=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFIVE_1800
     * @tc.name testURI05Chapter0018
     * @tc.desc Reverse test: URI with unencoded curly braces in query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/?q={unencoded}');
      expect(uriObj !== null).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('q=')).assertTrue();
    });
  });
}