import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import * as stringTest from './string_valueOf_test01';

export default function StringValueOfTest2(){
  describe('StringValueOfTest2', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0100
     * @tc.name      StringValueOfTest1113
     * @tc.desc      Verify modifying the return value of valueOf through Proxy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1113", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1113';

      const result:string = stringTest.testProxyOverride();
      expect(result).assertEqual("modified: test");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0200
     * @tc.name      StringValueOfTest1114
     * @tc.desc      Verify that the valueOf method is not writable by default
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1114", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1114';

      const result:boolean[] = stringTest.testValueDesc();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0300
     * @tc.name      StringValueOfTest1115
     * @tc.desc      Verify the behavior after freezing the valueOf method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1115", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1115';

      const result:string = stringTest.testFrozenValue();
      expect(result).assertEqual("frozen valueOf");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0400
     * @tc.name      StringValueOfTest1116
     * @tc.desc      Verify the behavior after deleting the valueOf method of the instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1116", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1116';

      const result:string[] = stringTest.testDeleteFallback();
      expect(result[0]).assertEqual("custom valueOf");
      expect(result[1]).assertEqual("test");
    });

    //================================In-depth Testing of Return Value Characteristics==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0500
     * @tc.name      StringValueOfTest1117
     * @tc.desc      Verify that the string values returned by multiple calls to valueOf are equal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1117", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1117';

      const str = new String("test");
      const result1 = str.valueOf();
      const result2 = str.valueOf();
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0600
     * @tc.name      StringValueOfTest1118
     * @tc.desc       Verify that the string returned by valueOf is immutable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1118", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1118';

      const str = new String("test");
      const result = str.valueOf();
      const setResult:boolean = Reflect.set(Object(result), 0, "T");
      expect(setResult).assertEqual(false);
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0700
     * @tc.name      StringValueOfTest1119
     * @tc.desc      vVerify the relationship between the return value of valueOf and string literals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1119", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1119';

      const original = "test";
      const str = new String(original);
      const result = str.valueOf();
      expect(result === original).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0800
     * @tc.name      StringValueOfTest1120
     * @tc.desc      Verify that valueOf returns a copy of the value rather than a reference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1120", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1120';

      const str = new String("test");
      const result = str.valueOf();
      expect(result === "test").assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0900
     * @tc.name      StringValueOfTest1121
     * @tc.desc      Verify that modifying the properties of a String object does not affect valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1121", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1121';

      const result:(string | boolean)[] = stringTest.testCustomPropValueOf();
      expect(result[0]).assertEqual("test");
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1000
     * @tc.name      StringValueOfTest1122
     * @tc.desc      Verify that multiple invocations of valueOf on the same String object return consistent results.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1122", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1122';

      const result:boolean = stringTest.testLoopValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1100
     * @tc.name      StringValueOfTest1123
     * @tc.desc      Verify that different String objects with the same content return the same valueOf value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1123", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1123';

      const result:boolean[] = stringTest.testCompareTwoStrings();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    //===================================Complete Testing of Exception Handling=================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1200
     * @tc.name      StringValueOfTest1124
     * @tc.desc      Verify that a TypeError is thrown when this is null
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1124", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1124';

      const result:(boolean | string)[] = stringTest.testNullValueOfThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1300
     * @tc.name      StringValueOfTest1125
     * @tc.desc      Verify that a TypeError is thrown when this is undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1125", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1125';

      const result:(boolean | string)[] = stringTest.testUndefValueOfThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1400
     * @tc.name      StringValueOfTest1126
     * @tc.desc      Verify the error message when this is null/undefined in strict mode
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1126", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1126';

      const result:(boolean | string)[] = stringTest.testStrictNullMsg();
      expect(result[0]).assertEqual(true);
      const msg:string = result[1] as string;
      expect(msg.length > 0).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1500
     * @tc.name      StringValueOfTest1127
     * @tc.desc       Verify the behavior when Number is used as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1127", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1127';

      const result:(boolean | string)[] = stringTest.testNumValueOfThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1600
     * @tc.name      StringValueOfTest1128
     * @tc.desc      Verify the behavior when Boolean is used as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1128", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1128';

      const result:(boolean | string)[] = stringTest.testBoolValueOfThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1700
     * @tc.name      StringValueOfTest1129
     * @tc.desc      Verify the behavior when a regular Object is used as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1129", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1129';

      const result:(boolean | string)[] = stringTest.testPlainObjThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1800
     * @tc.name      StringValueOfTest1130
     * @tc.desc      Verify the behavior when Array is used as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1130", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1130';

      const result:(boolean | string)[] = stringTest.testArrThrow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual("TypeError");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_1900
     * @tc.name      StringValueOfTest1131
     * @tc.desc      Verify the error message format in different environments
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1131", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1131';

      const ok:boolean = stringTest.testInvalidValueOf();
      expect(ok).assertEqual(true);
    });

    //=====================================Prototype Chain Depth Test=======================================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2000
     * @tc.name      StringValueOfTest1132
     * @tc.desc      Verify the differences between String.prototype.valueOf and Object.prototype.valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1132", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1132';

      const result:boolean[] = stringTest.testStrObjProto();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2100
     * @tc.name      StringValueOfTest1133
     * @tc.desc      Verify that String.prototype.valueOf overrides Object.prototype.valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1133", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1133';

      const result:boolean[] = stringTest.testProtoValueRef();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2200
     * @tc.name      StringValueOfTest1134
     * @tc.desc      Verify that String.prototype.valueOf overrides Object.prototype.valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1134", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1134';

      const result:boolean[] = stringTest.testValueOfOwn();
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2300
     * @tc.name      StringValueOfTest1135
     * @tc.desc      Verify the fallback behavior after deleting String.prototype.valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1135", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1135';

      const ok:boolean = stringTest.testDeleteStrValueOf();
      expect(ok).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2400
     * @tc.name      StringValueOfTest1136
     * @tc.desc      Verify overriding the valueOf method on a String instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1136", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1136';

      const result:(string | boolean)[] = stringTest.testInstanceValueOf();
      expect(result[0]).assertEqual("instance valueOf");
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2500
     * @tc.name      StringValueOfTest1137
     * @tc.desc      Verify overriding the valueOf method on String.prototype
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1137", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1137';

      const out:string = stringTest.testProtoWrap();
      expect(out).assertEqual("overridden: test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2600
     * @tc.name      StringValueOfTest1138
     * @tc.desc      Verify that the subclass overrides valueOf and calls the parent class method via super
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1138", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1138';

      const out:string = stringTest.testMyStringValueOf();
      expect(out).assertEqual("[test]");
    });

    //===================================Serialization Depth Test=======================================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2700
     * @tc.name      StringValueOfTest1139
     * @tc.desc      Verify the serialization of String objects by JSON.stringify
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1139", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1139';

      const str = new String("test");
      const json:string = JSON.stringify(str);
      expect(json).assertEqual("\"test\"");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2800
     * @tc.name      StringValueOfTest1140
     * @tc.desc      Verify the serialization of String objects nested within objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1140", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1140';

      const json:string = stringTest.testJsonObjWrap();
      expect(json).assertEqual('{"name":"John","age":30}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2900
     * @tc.name      StringValueOfTest1141
     * @tc.desc      Verify the serialization of String objects in the array
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1141", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1141';

      const json:string = stringTest.testJsonArrWrap();
      expect(json).assertEqual('["a","b","c"]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3000
     * @tc.name      StringValueOfTest1142
     * @tc.desc      Verify that the toJSON method takes precedence over valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1142", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1142';

      const json:string = stringTest.testStrToJson();
      expect(json).assertEqual("\"custom json\"");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3100
     * @tc.name      StringValueOfTest1143
     * @tc.desc      Verify the priority when both toJSON and valueOf exist
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1143", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1143';

      const result:(string | boolean)[] = stringTest.testObjToJsonValueOf();
      expect(result[0]).assertEqual("\"test\"");
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3200
     * @tc.name      StringValueOfTest1144
     * @tc.desc      Verify serialization when the String object property contains a circular reference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1144", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1144';

      const result:(string | boolean)[] = stringTest.testCircularStrJson();
      expect(result[1]).assertEqual(true);
      expect(result[0]).assertEqual("\"test\"");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3300
     * @tc.name      StringValueOfTest1145
     * @tc.desc      Verify serialization when the object contains a circular reference of String objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1145", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1145';

      const result:(string | boolean)[] = stringTest.testCircularObjJson();
      expect(result[1]).assertEqual(true);
      expect(result[0]).assertEqual('{"name":"test"}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3400
     * @tc.name      StringValueOfTest1146
     * @tc.desc      Verify the handling of circular references containing String objects using the replacer function
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1146", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1146';

      const json:string = stringTest.testCircularObjReplacer();
      expect(json).assertEqual('{"name":"test"}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3500
     * @tc.name      StringValueOfTest1147
     * @tc.desc      Verify that modifying the valueOf method affects JSON serialization
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1147", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1147';

      const json:string = stringTest.testJsonValueOfOverride();
      expect(json).assertEqual('{"value":"test"}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3600
     * @tc.name      StringValueOfTest1148
     * @tc.desc      Verify the behavior of JSON serialization when valueOf returns a non-string value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1148", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1148';

      const json:string = stringTest.testJsonValueOfObject();
      expect(json).assertEqual('{"value":"test"}');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_3700
     * @tc.name      StringValueOfTest1149
     * @tc.desc      Verify the behavior of JSON serialization when valueOf returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1149", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1149';

      const json:string = stringTest.testJsonValueOfUndefined();
      expect(json).assertEqual('{"value":"test"}');
    });


  });
}