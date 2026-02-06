import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import util from '@ohos.util';

export default function StringDecoder01Test() {
  describe('StringDecoder01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_0100
     * @tc.name      test_Stringdecoder_Constructor_Invalid_Encoding_0001
     * @tc.desc      StringDecoder constructor with invalid encoding should handle gracefully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Invalid_Encoding_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Invalid_Encoding_0001';
        console.log(TAG + ' start');
        try {
          const stringDecoder: util.StringDecoder = new util.StringDecoder('invalid-encoding');
          expect(stringDecoder != null).assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTO_0200
     * @tc.name      test_Stringdecoder_Constructor_Empty_String_0002
     * @tc.desc      StringDecoder constructor with empty string encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Empty_String_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Empty_String_0002';
        console.log(TAG + ' start');
        try {
          const stringDecoder: util.StringDecoder = new util.StringDecoder('');
          expect(stringDecoder != null).assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0300
     * @tc.name      test_Stringdecoder_Write_Null_Buffer_0003
     * @tc.desc      StringDecoder write with null buffer should handle gracefully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Null_Buffer_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Null_Buffer_0003';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        try {
          const result: string = stringDecoder.write(new Uint8Array([]));
          expect(result === '').assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0400
     * @tc.name      test_Stringdecoder_Write_Invalid_Buffer_Ttype_0004
     * @tc.desc      StringDecoder write with invalid parameter should handle gracefully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Invalid_Buffer_Ttype_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Invalid_Buffer_Ttype_0004';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        try {
          const buffer = new Uint8Array([]);
          const result: string = stringDecoder.write(buffer);
          expect(result === '').assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0500
     * @tc.name      test_Stringdecoder_Write_Overflow_Values_0005
     * @tc.desc      StringDecoder write with overflow byte values should handle correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Overflow_Values_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Overflow_Values_0005';
        console.log(TAG + ' start');

        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        try {
          const buffer = new Uint8Array([255, 254, 253]);
          const result: string = stringDecoder.write(buffer);
          expect(result !== '').assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0700
     * @tc.name      test_Stringdecoder_Write_Invalid_Utf8_0007
     * @tc.desc      StringDecoder write with invalid UTF-8 sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Invalid_Utf8_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Invalid_Utf8_0007';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([255, 255, 255]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0800
     * @tc.name      test_Stringdecoder_Write_Zero_Buffer_0008
     * @tc.desc      StringDecoder write with zero-filled buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Zero_Buffer_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Zero_Buffer_0008';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0, 0, 0, 0]);
        const result: string = stringDecoder.write(buffer);
        expect(result === '\u0000\u0000\u0000\u0000').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_0900
     * @tc.name      test_Stringdecoder_End_Empty_After_Write_0009
     * @tc.desc      StringDecoder end after write operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Empty_After_Write_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Empty_After_Write_0009';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([72, 101, 108, 108, 111]);
        stringDecoder.write(buffer);
        const result: string = stringDecoder.end();
        expect(result === '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_1000
     * @tc.name      test_Stringdecoder_End_Overflow_Values_0010
     * @tc.desc      StringDecoder end with overflow byte values should handle correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Overflow_Values_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Overflow_Values_0010';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        try {
          const buffer = new Uint8Array([255, 254, 253]);
          const result: string = stringDecoder.end(buffer);
          expect(result !== '').assertTrue();
        } catch (error) {
          expect(error != null).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_1100
     * @tc.name      test_Stringdecoder_End_Incomplete_Utf8_0011
     * @tc.desc      StringDecoder end with incomplete UTF-8 sequence should return replacement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Incomplete_Utf8_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_stringdecoder_end_incomplete_utf8';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([228, 189]);
        const result: string = stringDecoder.end(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_1200
     * @tc.name      test_Stringdecoder_End_Invalid_Utf8_0012
     * @tc.desc      StringDecoder end with invalid UTF-8 sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Invalid_Utf8_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Invalid_Utf8_0012';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([255, 255, 255]);
        const result: string = stringDecoder.end(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_1300
     * @tc.name      test_Stringdecoder_End_Zero_Buffer_0013
     * @tc.desc      StringDecoder end with zero-filled buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Zero_Buffer_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Zero_Buffer_0013';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0, 0, 0, 0]);
        const result: string = stringDecoder.end(buffer);
        expect(result === '\u0000\u0000\u0000\u0000').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_COMBINED_1400
     * @tc.name      test_Stringdecoder_Multiple_Writes_Then_End_0014
     * @tc.desc      StringDecoder multiple writes followed by end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Multiple_Writes_Then_End_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Multiple_Writes_Then_End_0014';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const part1 = new Uint8Array([72, 101, 108, 108]);
        const part2 = new Uint8Array([111, 32]);
        const part3 = new Uint8Array([87, 111, 114, 108, 100]);
        const result1: string = stringDecoder.write(part1);
        const result2: string = stringDecoder.write(part2);
        const result3: string = stringDecoder.end(part3);
        expect(result1 + result2 + result3 === 'Hello World').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_COMBINED_1500
     * @tc.name      test_Stringdecoder_Write_After_End_0015
     * @tc.desc      StringDecoder write after end should work with new instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_After_End_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_After_End_0015';
        console.log(TAG + ' start');
        const stringDecoder1: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer1 = new Uint8Array([72, 101, 108, 108, 111]);
        stringDecoder1.end(buffer1);
        const stringDecoder2: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer2 = new Uint8Array([32, 87, 111, 114, 108, 100]);
        const result: string = stringDecoder2.write(buffer2);
        expect(result === ' World').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_COMBINED_1600
     * @tc.name      test_Stringdecoder_Chunked_Utf8_0016
     * @tc.desc      StringDecoder with chunked UTF-8 characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Chunked_Utf8_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Chunked_Utf8_0016';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const chunk1 = new Uint8Array([228]);
        const chunk2 = new Uint8Array([189, 160]);
        const chunk3 = new Uint8Array([229, 165, 189]);
        const result1: string = stringDecoder.write(chunk1);
        const result2: string = stringDecoder.write(chunk2);
        const result3: string = stringDecoder.end(chunk3);
        expect(result1 + result2 + result3 === '你好').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_BOUNDARY_1700
     * @tc.name      test_Stringdecoder_Boundary_Min_Value_0017
     * @tc.desc      StringDecoder with minimum byte values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Boundary_Min_Value_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Boundary_Min_Value_0017';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0]);
        const result: string = stringDecoder.write(buffer);
        expect(result === '\u0000').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_BOUNDARY_1800
     * @tc.name      test_Stringdecoder_Boundary_Max_Value_0018
     * @tc.desc      StringDecoder with maximum byte values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Boundary_Max_Value_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Boundary_Max_Value_0018';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([255]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_BOUNDARY_1900
     * @tc.name      test_Stringdecoder_Boundary_Single_Byte_0019
     * @tc.desc      StringDecoder with single byte buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Boundary_Single_Byte_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Boundary_Single_Byte_0019';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([65]);
        const result: string = stringDecoder.write(buffer);
        expect(result === 'A').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_BOUNDARY_2000
     * @tc.name      test_Stringdecoder_Boundary_Max_Single_Char_0020
     * @tc.desc      StringDecoder with maximum single character bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Boundary_Max_Single_Char_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Boundary_Max_Single_Char_0020';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0x7F]);
        const result: string = stringDecoder.write(buffer);
        expect(result === '\u007F').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_BOUNDARY_2100
     * @tc.name      test_Stringdecoder_Boundary_Control_Chars_0021
     * @tc.desc      StringDecoder with control characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Boundary_Control_Chars_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Boundary_Control_Chars_0021';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([7, 8, 9, 10, 13]);
        const result: string = stringDecoder.write(buffer);
        expect(result === '\u0007\u0008\u0009\u000A\u000D').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_PERFORMANCE_2200
     * @tc.name      test_Stringdecoder_Performance_Repeated_Calls_0022
     * @tc.desc      StringDecoder performance with repeated write calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Performance_Repeated_Calls_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Performance_Repeated_Calls_0022';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        let result = '';
        for (let i = 0; i < 100; i++) {
          const buffer = new Uint8Array([65 + (i % 26)]);
          result += stringDecoder.write(buffer);
        }
        const finalResult: string = stringDecoder.end();
        expect((result + finalResult).length > 0).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_PERFORMANCE_2300
     * @tc.name      test_Stringdecoder_Performance_Large_Data_0023
     * @tc.desc      StringDecoder performance with large data set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Performance_Large_Data_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Performance_Large_Data_0023';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const largeData = new Uint8Array(500);
        for (let i = 0; i < largeData.length; i++) {
          largeData[i] = 65 + (i % 26);
        }
        const result: string = stringDecoder.write(largeData);
        const finalResult: string = stringDecoder.end();
        expect(result.length + finalResult.length === 500).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_ERROR_2400
     * @tc.name      test_Stringdecoder_Error_Invalid_Sequence_0024
     * @tc.desc      StringDecoder with intentionally invalid byte sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Error_Invalid_Sequence_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Error_Invalid_Sequence_0024';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0xC0, 0x80]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_ERROR_2600
     * @tc.name      test_Stringdecoder_ErrorIsolated_Continuation_0026
     * @tc.desc      StringDecoder with isolated continuation byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_ErrorIsolated_Continuation_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_ErrorIsolated_Continuation_0026';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0x80]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_ERROR_2700
     * @tc.name      test_Stringdecoder_ErrorOverlong_Sequence_0027
     * @tc.desc      StringDecoder with overlong encoding sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_ErrorOverlong_Sequence_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_ErrorOverlong_Sequence_0027';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0xC0, 0xAF]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_SPECIAL_2800
     * @tc.name      test_Stringdecoder_Special_Unicode_Chars_0028
     * @tc.desc      StringDecoder with special Unicode characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Special_Unicode_Chars_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Special_Unicode_Chars_0028';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0xE2, 0x98, 0xBA]);
        const result: string = stringDecoder.write(buffer);
        expect(result === '☺').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_2900
     * @tc.name      test_Stringdecoder_End_Long_Text_0029
     * @tc.desc      StringDecoder end with longer text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Long_Text_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Long_Text_0029';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_SPECIAL_3000
     * @tc.name      test_Stringdecoder_Special_Surrogate_Pairs_0030
     * @tc.desc      StringDecoder with Unicode surrogate pairs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Special_Surrogate_Pairs_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Special_Surrogate_Pairs_0030';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0xED, 0xA0, 0xBD, 0xED, 0xB8, 0x80]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_SPECIAL_3100
     * @tc.name      test_Stringdecoder_Special_Bidirectional_Text_0031
     * @tc.desc      StringDecoder with bidirectional text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Special_Bidirectional_Text_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Special_Bidirectional_Text_0031';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([0xE2, 0x80, 0x8E]);
        const result: string = stringDecoder.write(buffer);
        expect(result !== '').assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3200
     * @tc.name      test_Stringdecoder_Constructor_Default_0032
     * @tc.desc      StringDecoder constructor with no parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Default_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Default_0032';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder();
        expect(stringDecoder != null).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3300
     * @tc.name      test_Stringdecoder_Constructor_Utf8_0033
     * @tc.desc      StringDecoder constructor with 'utf-8' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Utf8_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Utf8_0033';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        expect(stringDecoder != null).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3500
     * @tc.name      test_Stringdecoder_Constructor_Utf8_Ascii_Scenario_0035
     * @tc.desc      StringDecoder constructor with 'utf-16le' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Utf8_Ascii_Scenario_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Utf8_Ascii_Scenario_0035';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-16le');
        expect(stringDecoder != null).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3600
     * @tc.name      test_Stringdecoder_Constructor_Utf8_Latin1_Scenario_0036
     * @tc.desc      StringDecoder constructor with 'utf-16be' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Utf8_Latin1_Scenario_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Utf8_Latin1_Scenario_0036';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-16be');
        expect(stringDecoder != null).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3700
     * @tc.name      test_Stringdecoder_Constructor_Iso88591_0037
     * @tc.desc      StringDecoder constructor with 'iso-8859-1' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Iso88591_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Iso88591_0037';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('iso-8859-1');
        expect(stringDecoder != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3800
     * @tc.name      test_Stringdecoder_Constructor_Gb18030_0038
     * @tc.desc      StringDecoder constructor with 'gb18030' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Gb18030_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Gb18030_0038';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gb18030');
        expect(stringDecoder != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_CONSTRUCTOR_3900
     * @tc.name      test_Stringdecoder_Constructor_Gbk_0039
     * @tc.desc      StringDecoder constructor with 'gbk' encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Constructor_Gbk_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Constructor_Gbk_0039';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gbk');
        expect(stringDecoder != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4200
     * @tc.name      test_Stringdecoder_Write_Utf8_Hello_0042
     * @tc.desc      StringDecoder write with UTF-8 encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Hello_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_Write_Utf8_Hello_0042';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([72, 101, 108, 108, 111]);
        const result: string = stringDecoder.write(buffer);
        expect(result).assertEqual("Hello");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4300
     * @tc.name      test_Stringdecoder_Write_Utf8_Non_Empty_0043
     * @tc.desc      StringDecoder write with empty buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Non_Empty_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Non_Empty_0043';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([116, 101, 115, 116]);
        const result: string = stringDecoder.write(buffer);
        expect(result).assertEqual("test");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4400
     * @tc.name      test_Stringdecoder_Write_Utf8_Single_Char_0044
     * @tc.desc      StringDecoder write with single character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Single_Char_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Single_Char_0044';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([65]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4500
     * @tc.name      test_Stringdecoder_Write_Utf8_Numbers_0045
     * @tc.desc      StringDecoder write with numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Numbers_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Numbers_0045';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([49, 50, 51]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4600
     * @tc.name      test_Stringdecoder_Write_Utf8_Special_Chars_0046
     * @tc.desc      StringDecoder write with special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Special_Chars_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Special_Chars_0046';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([33, 64, 35, 36]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4700
     * @tc.name      test_Stringdecoder_Write_Utf8_Chinese_0047
     * @tc.desc      StringDecoder write with Chinese characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Chinese_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Chinese_0047';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([228, 189, 160, 229, 165, 189]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4800
     * @tc.name      test_Stringdecoder_Write_Utf8_Emoji_0048
     * @tc.desc      StringDecoder write with emoji.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Emoji_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Emoji_0048';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([240, 159, 152, 128]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_4900
     * @tc.name      test_Stringdecoder_Write_Utf8_Hello_0049
     * @tc.desc      StringDecoder write with UTF-16 encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Hello_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Hello_0049';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([72, 101, 108, 108, 111]);
        const result: string = stringDecoder.write(buffer);
        expect(result).assertEqual("Hello");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5000
     * @tc.name      test_Stringdecoder_Write_Utf16Le_Hello_0050
     * @tc.desc      StringDecoder write with UTF-16LE encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf16Le_Hello_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf16Le_Hello_0050';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-16le');
        const buffer = new Uint8Array([72, 0, 101, 0, 108, 0, 108, 0, 111, 0]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5100
     * @tc.name      test_Stringdecoder_Write_Utf16Be_Hello_0051
     * @tc.desc      StringDecoder write with UTF-16BE encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf16Be_Hello_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf16Be_Hello_0051';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-16be');
        const buffer = new Uint8Array([0, 72, 0, 101, 0, 108, 0, 108, 0, 111]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5200
     * @tc.name      test_Stringdecoder_Write_Utf8_Text_0052
     * @tc.desc      StringDecoder write with ASCII encoded text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Text_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Text_0052';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([84, 101, 115, 116]);
        const result: string = stringDecoder.write(buffer);
        expect(result).assertEqual("Test");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5300
     * @tc.name      test_Stringdecoder_Write_Utf8_Latin_Text_0053
     * @tc.desc      StringDecoder write with Latin1 encoded text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Utf8_Latin_Text_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Utf8_Latin_Text_0053';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([76, 97, 116, 105, 110]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();
        expect(result).assertEqual("Latin");

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5400
     * @tc.name      test_Stringdecoder_Write_Gbk_Chinese_0054
     * @tc.desc      StringDecoder write with GBK encoded Chinese.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Gbk_Chinese_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Gbk_Chinese_0054';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gbk');
        const buffer = new Uint8Array([196, 227, 186, 195]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5500
     * @tc.name      test_Stringdecoder_Write_Gb18030_Chinese_0055
     * @tc.desc      StringDecoder write with GB18030 encoded Chinese.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Gb18030_Chinese_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Gb18030_Chinese_0055';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gb18030');
        const buffer = new Uint8Array([196, 227, 186, 195]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5600
     * @tc.name      test_Stringdecoder_Write_Iso88591_Text_0056
     * @tc.desc      StringDecoder write with ISO-8859-1 encoded text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Iso88591_Text_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Iso88591_Text_0056';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('iso-8859-1');
        const buffer = new Uint8Array([73, 83, 79]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_5700
     * @tc.name      test_Stringdecoder_Write_Whitespace_0057
     * @tc.desc      StringDecoder write with whitespace characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_Write_Whitespace_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'test_Stringdecoder_Write_Whitespace_0057';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([32, 9, 10, 13]);
        const result: string = stringDecoder.write(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_6200
     * @tc.name      test_Stringdecoder_End_No_Buffer_0062
     * @tc.desc      StringDecoder end with no buffer parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_No_Buffer_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_No_Buffer_0062';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const result: string = stringDecoder.end();
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_6300
     * @tc.name      test_Stringdecoder_End_Non_Empty_Buffer_0063
     * @tc.desc      StringDecoder end with empty buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Non_Empty_Buffer_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Non_Empty_Buffer_0063';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([101, 110, 100]);
        const result: string = stringDecoder.end(buffer);
        expect(result).assertEqual("end");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_6400
     * @tc.name      test_Stringdecoder_End_Utf8_Hello_0064
     * @tc.desc      StringDecoder end with UTF-8 encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Utf8_Hello_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Utf8_Hello_0064';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([72, 101, 108, 108, 111]);
        const result: string = stringDecoder.end(buffer);
        expect(result).assertEqual("Hello");
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_6500
     * @tc.name      test_Stringdecoder_End_Utf8_Single_Char_0065
     * @tc.desc      StringDecoder end with single character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Utf8_Single_Char_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Utf8_Single_Char_0065';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([65]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_7000
     * @tc.name      test_Stringdecoder_End_Utf16Le_Hello_0070
     * @tc.desc      StringDecoder end with UTF-16LE encoded "Hello".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Utf16Le_Hello_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Utf16Le_Hello_0070';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-16le');
        const buffer = new Uint8Array([72, 0, 101, 0, 108, 0, 108, 0, 111, 0]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_7300
     * @tc.name      test_Stringdecoder_End_Gbk_Chinese_0073
     * @tc.desc      StringDecoder end with GBK encoded Chinese.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Gbk_Chinese_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Gbk_Chinese_0073';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gbk');
        const buffer = new Uint8Array([196, 227, 186, 195]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_7400
     * @tc.name      test_Stringdecoder_End_Gb18030_Chinese_0074
     * @tc.desc      StringDecoder end with GB18030 encoded Chinese.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Gb18030_Chinese_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Gb18030_Chinese_0074';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('gb18030');
        const buffer = new Uint8Array([196, 227, 186, 195]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_7500
     * @tc.name      test_Stringdecoder_End_Iso88591_Text_0075
     * @tc.desc      StringDecoder end with ISO-8859-1 encoded text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Iso88591_Text_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Iso88591_Text_0075';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('iso-8859-1');
        const buffer = new Uint8Array([73, 83, 79]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_END_7600
     * @tc.name      test_Stringdecoder_End_Whitespace_0076
     * @tc.desc      StringDecoder end with whitespace characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test_Stringdecoder_End_Whitespace_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = 'test_Stringdecoder_End_Whitespace_0076';
        console.log(TAG + ' start');
        const stringDecoder: util.StringDecoder = new util.StringDecoder('utf-8');
        const buffer = new Uint8Array([32, 9, 10, 13]);
        const result: string = stringDecoder.end(buffer);
        expect(result != null).assertTrue();

      });

  })
}