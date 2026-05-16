import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import util from '@ohos.util';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function TextDecoderTest() {
  describe('TextDecoderTest', () => {
    let textDecoder: util.TextDecoder;
    textDecoder = new util.TextDecoder();
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0100
     * @tc.name      Test_decode_ascii_basic_alpha_0001
     * @tc.desc      Decode ASCII letter combinations (uppercase and lowercase)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_basic_alpha_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_basic_alpha_0001";
      console.log(TAG + " start");
      const bytes = new Uint8Array([65, 97, 66, 98, 90, 122]); // "AaBbZz"
      const expected = "AaBbZz";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0200
     * @tc.name      Test_decode_ascii_number_0002
     * @tc.desc      Decode ASCII number combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_number_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_number_0002";
      console.log(TAG + " start");
      const bytes = new Uint8Array([48, 49, 57, 46, 45, 43]); // "019.-+"
      const expected = "019.-+";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0300
     * @tc.name      Test_decode_ascii_punctuation_0003
     * @tc.desc      Decode ASCII punctuation symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_punctuation_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_punctuation_0003";
      console.log(TAG + " start");
      const bytes = new Uint8Array([33, 63, 44, 59, 58, 34, 39]); // "!?,;:\"'"
      const expected = "!?,;:\"'";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0400
     * @tc.name      Test_decode_ascii_space_0004
     * @tc.desc      Decode ASCII space, tab, newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_space_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_space_0004";
      console.log(TAG + " start");
      const bytes = new Uint8Array([32, 9, 10, 13]); // " \t\n\r"
      const expected = " \t\n\r";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0500
     * @tc.name      Test_decode_ascii_short_str_0005
     * @tc.desc      Decode 1-byte ASCII short string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_short_str_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_short_str_0005";
      console.log(TAG + " start");
      const bytes = new Uint8Array([120]); // "x"
      const expected = "x";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0600
     * @tc.name      Test_decode_ascii_long_str_0006
     * @tc.desc      Decode long ASCII string (50 characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_long_str_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_long_str_0006";
      console.log(TAG + " start");
      const expected = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0700
     * @tc.name      Test_decode_ascii_special_control_0007
     * @tc.desc      Decode ASCII control characters (non-printable)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_special_control_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_special_control_0007";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0x00, 0x01, 0x08, 0x0C]); // Null character, SOH, backspace, form feed
      const expected = "\x00\x01\x08\x0C";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0800
     * @tc.name      Test_decode_ascii_url_char_0008
     * @tc.desc      Decode URL common characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_url_char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_url_char_0008";
      console.log(TAG + " start");
      const bytes = new Uint8Array([47, 63, 38, 61, 37, 35]); // "/?&=%#"
      const expected = "/?&=%#";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_0900
     * @tc.name      Test_decode_ascii_program_char_0009
     * @tc.desc      Decode programming common symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_program_char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_program_char_0009";
      console.log(TAG + " start");
      // Correct byte array order to match expected string "{[]}()*/"
      const bytes = new Uint8Array([123, 91, 93, 125, 40, 41, 42, 47]);
      const expected = "{[]}()*/";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1000
     * @tc.name      Test_decode_ascii_mixed_alpha_num_0010
     * @tc.desc      Decode mixed letter+number ASCII string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_ascii_mixed_alpha_num_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_ascii_mixed_alpha_num_0010";
      console.log(TAG + " start");
      const bytes = new Uint8Array([84, 101, 115, 116, 49, 50, 51]); // "Test123"
      const expected = "Test123";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });


    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1100
     * @tc.name      Test_decode_unicode_latin1_0011
     * @tc.desc      Decode Latin-1 supplementary characters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_latin1_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_latin1_0011";
      console.log(TAG + " start");
      const expected = "ÀÁéñÿ";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1200
     * @tc.name      Test_decode_unicode_currency_0012
     * @tc.desc      Decode currency symbols (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_currency_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_currency_0012";
      console.log(TAG + " start");
      const expected = "¢£¤¥€";
      const bytes = new util.TextEncoder().encode(expected); // Automatically generate standard UTF-8 byte array
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1300
     * @tc.name      Test_decode_unicode_symbol_0013
     * @tc.desc      Decode mathematical symbols (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_symbol_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_symbol_0013";
      console.log(TAG + " start");
      const expected = "±²³×÷";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1400
     * @tc.name      Test_decode_unicode_greek_0014
     * @tc.desc      Decode Greek letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_greek_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_greek_0014";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xCE, 0x91, 0xCE, 0x92, 0xCE, 0x93]); // "ΑΒΓ"
      const expected = "ΑΒΓ";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1500
     * @tc.name      Test_decode_unicode_cyrillic_0015
     * @tc.desc      Decode Cyrillic letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_cyrillic_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_cyrillic_0015";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xD0, 0x90, 0xD0, 0x91, 0xD0, 0x92]); // "АБВ"
      const expected = "АБВ";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1600
     * @tc.name      Test_decode_unicode_arabic_0016
     * @tc.desc      Decode Arabic letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_arabic_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_arabic_0016";
      console.log(TAG + " start");
      const expected = "أبج";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1700
     * @tc.name      Test_decode_unicode_hebrew_0017
     * @tc.desc      Decode Hebrew letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_hebrew_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_hebrew_0017";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xD7, 0x90, 0xD7, 0x91, 0xD7, 0x92]); // "אבג"
      const expected = "אבג";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1800
     * @tc.name      Test_decode_unicode_thai_0018
     * @tc.desc      Decode Thai letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_thai_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_thai_0018";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xE0, 0xB8, 0x81, 0xE0, 0xB8, 0x82]); // "กข"
      const expected = "กข";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_1900
     * @tc.name      Test_decode_unicode_hindi_0019
     * @tc.desc      Decode Hindi letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_hindi_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_hindi_0019";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xE0, 0xA4, 0x95, 0xE0, 0xA4, 0x96]); // "कख"
      const expected = "कख";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2000
     * @tc.name      Test_decode_unicode_tamil_0020
     * @tc.desc      Decode Tamil letters (single-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_tamil_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_tamil_0020";
      console.log(TAG + " start");
      const expected = "கச";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });


    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2100
     * @tc.name      Test_decode_unicode_chinese_basic_0021
     * @tc.desc      Decode basic Chinese characters (3-byte UTF-8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_chinese_basic_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_chinese_basic_0021";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xE4, 0xB8, 0xAD, 0xE6, 0x96, 0x87, 0xE7, 0x9A, 0x84]); // "中文的"
      const expected = "中文的";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2200
     * @tc.name      Test_decode_unicode_chinese_classical_0022
     * @tc.desc      Decode rare Chinese characters (3-byte UTF-8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_chinese_classical_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_chinese_classical_0022";
      console.log(TAG + " start");
      const expected = "魓龱砳";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2300
     * @tc.name      Test_decode_unicode_japanese_0023
     * @tc.desc      Decode Japanese hiragana and katakana (3-byte UTF-8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_japanese_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_japanese_0023";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xE3, 0x81, 0x82, 0xE3, 0x81, 0x84, 0xE5, 0x86, 0x85]); // "あい内"
      const expected = "あい内";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2400
     * @tc.name      Test_decode_unicode_korean_0024
     * @tc.desc      Decode Korean Hangul (3-byte UTF-8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_korean_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_korean_0024";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xEC, 0x95, 0x88, 0xEB, 0x85, 0x95, 0xEA, 0xB5, 0xAD]); // "안녕국"
      const expected = "안녕국";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2500
     * @tc.name      Test_decode_unicode_emoji_basic_0025
     * @tc.desc      Decode basic emoji (4-byte UTF-8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_emoji_basic_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_emoji_basic_0025";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xF0, 0x9F, 0x98, 0x81, 0xF0, 0x9F, 0x98, 0x82]); // "😁😂"
      const expected = "😁😂";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2600
     * @tc.name      Test_decode_unicode_emoji_flag_0026
     * @tc.desc      Decode flag emoji (regional indicator symbol pairs)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_emoji_flag_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_emoji_flag_0026";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xF0, 0x9F, 0x87, 0xA8, 0xF0, 0x9F, 0x87, 0xB3]); // "🇨🇳"
      const expected = "🇨🇳";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2700
     * @tc.name      Test_decode_unicode_emoji_modifier_0027
     * @tc.desc      Decode emoji with skin tone modifiers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_emoji_modifier_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_emoji_modifier_0027";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xF0, 0x9F, 0x91, 0xA4, 0xF0, 0x9F, 0x8F, 0xBD]); // "👤🏽"
      const expected = "👤🏽";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2800
     * @tc.name      Test_decode_unicode_math_symbol_0028
     * @tc.desc      Decode complex mathematical symbols (multi-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_math_symbol_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_math_symbol_0028";
      console.log(TAG + " start");
      const expected = "∞∆Σ";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_2900
     * @tc.name      Test_decode_unicode_arrow_0029
     * @tc.desc      Decode arrow symbols (multi-byte Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_arrow_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_arrow_0029";
      console.log(TAG + " start");
      const expected = "→↑↊";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3000
     * @tc.name      Test_decode_unicode_symbols_mixed_0030
     * @tc.desc      Decode mixed multi-byte symbols (stars, hearts, etc.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_unicode_symbols_mixed_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_unicode_symbols_mixed_0030";
      console.log(TAG + " start");
      const expected = "✅❤️⭐";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });


    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3100
     * @tc.name      Test_decode_mix_ascii_chinese_0031
     * @tc.desc      Mixed scenario: ASCII + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_ascii_chinese_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_ascii_chinese_0031";
      console.log(TAG + " start");
      const bytes = new Uint8Array([72, 101, 108, 108, 111, 32, 0xE4, 0xB8, 0xAD, 0xE6, 0x96, 0x87]); // "Hello 中文"
      const expected = "Hello 中文";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3200
     * @tc.name      Test_decode_mix_chinese_emoji_0032
     * @tc.desc      Mixed scenario: Chinese + emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_chinese_emoji_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_chinese_emoji_0032";
      console.log(TAG + " start");
      const bytes = new Uint8Array([0xE5, 0x8F, 0xAF, 0xE7, 0x88, 0xB1, 0x20, 0xF0, 0x9F, 0x98, 0x8A]); // "可爱 😊"
      const expected = "可爱 😊";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3300
     * @tc.name      Test_decode_mix_ascii_japanese_korean_0033
     * @tc.desc      Mixed scenario: ASCII + Japanese + Korean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_ascii_japanese_korean_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_ascii_japanese_korean_0033";
      console.log(TAG + " start");
      const bytes = new Uint8Array([84, 101, 115, 116, 32, 0xE3, 0x81, 0x82, 0xEB, 0x85, 0x95]); // "Test あ녕"
      const expected = "Test あ녕";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3400
     * @tc.name      Test_decode_mix_multi_lang_0034
     * @tc.desc      Mixed scenario: Chinese + English + French + German
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_multi_lang_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_multi_lang_0034";
      console.log(TAG + " start");
      const expected = "中文 English Écran Öste";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3500
     * @tc.name      Test_decode_mix_ascii_symbol_currency_0035
     * @tc.desc      Mixed scenario: ASCII + symbols + currency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_ascii_symbol_currency_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_ascii_symbol_currency_0035";
      console.log(TAG + " start");
      const expected = "Price: €100 £20";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3600
     * @tc.name      Test_decode_mix_chinese_number_punctuation_0036
     * @tc.desc      Mixed scenario: Chinese + numbers + punctuation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_chinese_number_punctuation_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

        const TAG = "Test_decode_mix_chinese_number_punctuation_0036";
        console.log(TAG + " start");
        const expected = "我的学习课X1234!?";
        const bytes = new util.TextEncoder().encode(expected);
        const actual = textDecoder.decodeToString(bytes);
        expect(actual === expected).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3700
     * @tc.name      Test_decode_mix_emoji_flag_lang_0037
     * @tc.desc      Mixed scenario: Emoji + flags + multiple languages
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_emoji_flag_lang_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_emoji_flag_lang_0037";
      console.log(TAG + " start");
      const expected = "😋 🇺🇸 日本語 한국어";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3800
     * @tc.name      Test_decode_mix_ascii_control_chinese_0038
     * @tc.desc      Mixed scenario: ASCII control characters + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_ascii_control_chinese_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_ascii_control_chinese_0038";
      console.log(TAG + " start");
      const bytes =
        new Uint8Array([9, 0xE4, 0xB8, 0xAD, 0xE6, 0x96, 0x87, 10, 0xE7, 0x94, 0xB5, 0xE8, 0xAF, 0x9D]); // "\t中文\n电话"
      const expected = "\t中文\n电话";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_3900
     * @tc.name      Test_decode_mix_math_symbol_chinese_0039
     * @tc.desc      Mixed scenario: Mathematical symbols + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_math_symbol_chinese_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_math_symbol_chinese_0039";
      console.log(TAG + " start");
      const bytes = new Uint8Array([
        0xE6, 0x95, 0xB0, 0xE5, 0xAD, 0xA6, 0xE5, 0x85, 0xAC, 0xE5, 0xBC, 0x8F, 32, 0xE2, 0x88, 0x9A,
        32, 0x31, 0x2B, 0x32, 0x3D, 0x33, 32, 0xE2, 0x88, 0x9E
      ]); // "数学公式 √ 1+2=3 ∞"
      const expected = "数学公式 √ 1+2=3 ∞";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4000
     * @tc.name      Test_decode_mix_url_char_chinese_0040
     * @tc.desc      Mixed scenario: URL characters + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_url_char_chinese_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_url_char_chinese_0040";
      console.log(TAG + " start");
      const expected = "https://网页.com/查询?keyword=中文";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4100
     * @tc.name      Test_decode_mix_program_char_chinese_0041
     * @tc.desc      Mixed scenario: Programming symbols + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_program_char_chinese_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_program_char_chinese_0041";
      console.log(TAG + " start");
      const bytes = new Uint8Array([
        123, 32, 0x22, 0xE5, 0x90, 0x8D, 0xE7, 0xA7, 0xB0, 0x22, 58, 32, 0x22, 0xE5, 0xBC, 0xA0, 0xE4, 0xB8, 0x89, 0x22,
        32, 125
      ]); // "{ \"名称\": \"张三\" }"
      const expected = "{ \"名称\": \"张三\" }";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4200
     * @tc.name      Test_decode_mix_long_multi_lang_0042
     * @tc.desc      Mixed scenario: Long string (ASCII + Chinese + Japanese + emoji) mix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_long_multi_lang_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_long_multi_lang_0042";
      console.log(TAG + " start");
      const expected = "OpenHarmony是一款面向全场景的分布式操作系统，支持多种设备协同工作！🇨🇳 ありがとう 😊 1234567890";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4300
     * @tc.name      Test_decode_mix_cyrillic_arabic_chinese_0043
     * @tc.desc      Mixed scenario: Cyrillic + Arabic + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_cyrillic_arabic_chinese_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_cyrillic_arabic_chinese_0043";
      console.log(TAG + " start");
      const bytes = new Uint8Array([
        0xD0, 0x9F, 0xD1, 0x80, 0xD0, 0xB8, 0xD0, 0xB2, 0xD0, 0xB5, 0xD1, 0x82, 32,
        0xD8, 0xA7, 0xD9, 0x84, 0xD8, 0xB3, 0xD9, 0x84, 0xD8, 0xA7, 0xD9, 0x85, 32,
        0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD
      ]); // "Привет السلام 你好"
      const expected = "Привет السلام 你好";
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4400
     * @tc.name      Test_decode_mix_emoji_modifier_chinese_0044
     * @tc.desc      Mixed scenario: Emoji with modifiers + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_emoji_modifier_chinese_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_emoji_modifier_chinese_0044";
      console.log(TAG + " start");
      const expected = "👦🏻 拍照 ❩🏼";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4500
     * @tc.name      Test_decode_mix_latin1_chinese_number_0045
     * @tc.desc      Mixed scenario: Latin-1 characters + Chinese + numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_latin1_chinese_number_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_latin1_chinese_number_0045";
      console.log(TAG + " start");
      const expected = "élè语 中文 12345 ÖÜ";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4600
     * @tc.name      Test_decode_mix_arrow_chinese_punctuation_0046
     * @tc.desc      Mixed scenario: Arrow symbols + Chinese + punctuation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_arrow_chinese_punctuation_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

        const TAG = "Test_decode_mix_arrow_chinese_punctuation_0046";
        console.log(TAG + " start");
        const expected = "→ 可以 迭代 ↑ 的语言 !->";
        const bytes = new util.TextEncoder().encode(expected);
        const actual = textDecoder.decodeToString(bytes);
        expect(actual === expected).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4700
     * @tc.name      Test_decode_mix_hebrew_thai_chinese_0047
     * @tc.desc      Mixed scenario: Hebrew + Thai + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_hebrew_thai_chinese_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_hebrew_thai_chinese_0047";
      console.log(TAG + " start");
      const expected = "שלום สวัสดี 同行";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4800
     * @tc.name      Test_decode_mix_hindi_tamil_chinese_0048
     * @tc.desc      Mixed scenario: Hindi + Tamil + Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_hindi_tamil_chinese_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_hindi_tamil_chinese_0048";
      console.log(TAG + " start");
      const expected = "नमस्ते திஸ் 可生";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_4900
     * @tc.name      Test_decode_mix_symbols_emoji_ascii_0049
     * @tc.desc      Mixed scenario: Special symbols + emoji + ASCII
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_symbols_emoji_ascii_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const TAG = "Test_decode_mix_symbols_emoji_ascii_0049";
      console.log(TAG + " start");
      const expected = "✏️ ❤️ 🌎 Cool Symbols";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();

    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5000
     * @tc.name      Test_decode_mix_all_scenario_0050
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "Test_decode_mix_all_scenario_0050";
      console.log(TAG + " start");
      const expected = "最终测试：¥100 €50 1+1=2 ありがとう 😊 中文+English+Français 🌟";
      const bytes = new util.TextEncoder().encode(expected);
      const actual = textDecoder.decodeToString(bytes);
      expect(actual === expected).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5100
     * @tc.name      Test_decode_mix_all_scenario_0051
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto('\udc04 kilu');
      expect(JSON.stringify(result)).assertEqual('{"0":237,"1":176,"2":132,"3":32,"4":107,"5":105,"6":108,"7":117}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual('��� kilu');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5200
     * @tc.name      Test_decode_mix_all_scenario_0052
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto('\ud83c\udf85');
      expect(JSON.stringify(result)).assertEqual('{"0":240,"1":159,"2":142,"3":133}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual('\ud83c\udf85');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5300
     * @tc.name      Test_decode_mix_all_scenario_0053
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto(init(3));
      expect(JSON.stringify(result))
        .assertEqual('{"0":91,"1":123,"2":34,"3":97,"4":34,"5":58,"6":49,"7":125,"8":44,"9":123,"10":34,"11":97,"12":34,"13":58,"14":49,"15":125,"16":93}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual(init(3));
    });


    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5400
     * @tc.name      Test_decode_mix_all_scenario_0054
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let str = "{k1:value1,k2:value2}"
      let str1 = str.substring(0, str.length - 2);
      let result = textEncoder.encodeInto(str1);
      expect(JSON.stringify(result))
        .assertEqual('{"0":123,"1":107,"2":49,"3":58,"4":118,"5":97,"6":108,"7":117,"8":101,"9":49,"10":44,"11":107,"12":50,"13":58,"14":118,"15":97,"16":108,"17":117,"18":101}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual(str1);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5500
     * @tc.name      Test_decode_mix_all_scenario_0055
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto('\n \\');
      expect(JSON.stringify(result)).assertEqual('{"0":10,"1":32,"2":92}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual('\n \\');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER_DECODETOSTRING_5600
     * @tc.name      Test_decode_mix_all_scenario_0056
     * @tc.desc      Mixed scenario: ASCII + Chinese + Japanese + emoji + currency + mathematical symbols (full scenario coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("Test_decode_mix_all_scenario_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let textEncoder = new util.TextEncoder();
      let result = textEncoder.encodeInto('\\\\');
      expect(JSON.stringify(result)).assertEqual('{"0":92,"1":92}');
      let textDecoder =new util.TextDecoder();
      let result2 = textDecoder.decodeToString(result);
      expect(result2).assertEqual('\\\\');
    });
  });
}

function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}