/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

export default function Uri_Emoji() {
  describe('Uri_Emoji', () => {
    /**
     * @tc.name   testUriConstructorEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%A4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%AB");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.desc   Testing the Uri interface Constructor with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0004";
      try {
        const emoji = "\u260e";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%E2%98%8E");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%B9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%95%9B");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%8D%8F");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%94%83");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%8D%81");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.desc   Testing the Uri interface Constructor with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0010";
      try {
        const emoji = "\u2666";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%E2%99%A6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstructorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testUriConstructorEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%88");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriConstructorEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.desc   Testing the Uri interface Constructor with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstructorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriConstructorEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1300
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let mm = new uri.URI(emoji);
        let result = mm.toString();
        expect(result).assertEqual("%F0%9F%98%8A");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1400
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0002"
      try {
        const emoji = "\ud83d\udc64"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%A4")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1500
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0003"
      try {
        const emoji = "\ud83d\udc6b"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%AB")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1600
     * @tc.desc   Testing the Uri interface ToString with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0004"
      try {
        const emoji = "\u260e"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%E2%98%8E")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1700
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0005"
      try {
        const emoji = "\ud83d\udc79"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%B9")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1800
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0006"
      try {
        const emoji = "\ud83d\udd5b"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%95%9B")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1900
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0007"
      try {
        const emoji = "\ud83c\udf4f"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%8D%8F")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2000
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0008"
      try {
        const emoji = "\ud83d\udd03"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%94%83")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2100
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0009"
      try {
        const emoji = "\ud83c\udf41"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%8D%81")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2200
     * @tc.desc   Testing the Uri interface ToString with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0010"
      try {
        const emoji = "\u2666"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%E2%99%A6")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2300
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0011"
      try {
        const emoji = "\ud83d\udc48"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%88")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriToStringEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2400
     * @tc.desc   Testing the Uri interface ToString with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriToStringEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriToStringEmoji0012"
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2500
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0001"
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\ude0a&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\ude0a');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\ude0a")
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\ude0a")
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2600
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0002";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc64&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc64');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc64");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc64");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2700
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0003";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc6b&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc6b');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc6b");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc6b");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2800
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0004";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\u260e&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\u260e');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\u260e");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\u260e");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2900
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0005";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc79&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc79');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc79");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc79");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3000
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0006";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udd5b&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udd5b');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udd5b");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udd5b");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3100
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0007";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83c\udf4f&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83c\udf4f');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83c\udf4f");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83c\udf4f");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3200
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0008";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udd03&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udd03');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udd03");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udd03");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3300
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0009";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83c\udf41&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83c\udf41');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83c\udf41");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83c\udf41");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3400
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji '\u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0010";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\u2666&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\u2666');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\u2666");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\u2666");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3500
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0011";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc48&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc48');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc48");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc48");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValueEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3600
     * @tc.desc   Testing the Uri interface GetQueryValue with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValueEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValueEmoji0012";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83e\udd3c\u200d\u2642\ufe0f&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83e\udd3c\u200d\u2642\ufe0f');
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3700
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('smile', emoji);
        let newUri2 = newUri1.addQueryValue('smile', emoji);
        let newUri3 = newUri2.addQueryValue('smile', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?smile=%F0%9F%98%8A');
        expect(newUri2.toString()).assertEqual('http://test.com?smile=%F0%9F%98%8A&smile=%F0%9F%98%8A');
        expect(newUri3.toString())
          .assertEqual('http://test.com?smile=%F0%9F%98%8A&smile=%F0%9F%98%8A&smile=%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3800
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('avatar', emoji);
        let newUri2 = newUri1.addQueryValue('avatar', emoji);
        let newUri3 = newUri2.addQueryValue('avatar', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?avatar=%F0%9F%91%A4');
        expect(newUri2.toString()).assertEqual('http://test.com?avatar=%F0%9F%91%A4&avatar=%F0%9F%91%A4');
        expect(newUri3.toString())
          .assertEqual('http://test.com?avatar=%F0%9F%91%A4&avatar=%F0%9F%91%A4&avatar=%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3900
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('parent', emoji);
        let newUri2 = newUri1.addQueryValue('parent', emoji);
        let newUri3 = newUri2.addQueryValue('parent', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?parent=%F0%9F%91%AB');
        expect(newUri2.toString()).assertEqual('http://test.com?parent=%F0%9F%91%AB&parent=%F0%9F%91%AB');
        expect(newUri3.toString())
          .assertEqual('http://test.com?parent=%F0%9F%91%AB&parent=%F0%9F%91%AB&parent=%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4000
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0004";
      try {
        let emoji = '\u260e';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('phone', emoji);
        let newUri2 = newUri1.addQueryValue('phone', emoji);
        let newUri3 = newUri2.addQueryValue('phone', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?phone=%E2%98%8E');
        expect(newUri2.toString()).assertEqual('http://test.com?phone=%E2%98%8E&phone=%E2%98%8E');
        expect(newUri3.toString()).assertEqual('http://test.com?phone=%E2%98%8E&phone=%E2%98%8E&phone=%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4100
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('grimace', emoji);
        let newUri2 = newUri1.addQueryValue('grimace', emoji);
        let newUri3 = newUri2.addQueryValue('grimace', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?grimace=%F0%9F%91%B9');
        expect(newUri2.toString()).assertEqual('http://test.com?grimace=%F0%9F%91%B9&grimace=%F0%9F%91%B9');
        expect(newUri3.toString())
          .assertEqual('http://test.com?grimace=%F0%9F%91%B9&grimace=%F0%9F%91%B9&grimace=%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4200
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('timepiece', emoji);
        let newUri2 = newUri1.addQueryValue('timepiece', emoji);
        let newUri3 = newUri2.addQueryValue('timepiece', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?timepiece=%F0%9F%95%9B');
        expect(newUri2.toString()).assertEqual('http://test.com?timepiece=%F0%9F%95%9B&timepiece=%F0%9F%95%9B');
        expect(newUri3.toString())
          .assertEqual('http://test.com?timepiece=%F0%9F%95%9B&timepiece=%F0%9F%95%9B&timepiece=%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4300
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('apple', emoji);
        let newUri2 = newUri1.addQueryValue('apple', emoji);
        let newUri3 = newUri2.addQueryValue('apple', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?apple=%F0%9F%8D%8F');
        expect(newUri2.toString()).assertEqual('http://test.com?apple=%F0%9F%8D%8F&apple=%F0%9F%8D%8F');
        expect(newUri3.toString())
          .assertEqual('http://test.com?apple=%F0%9F%8D%8F&apple=%F0%9F%8D%8F&apple=%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4400
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('recovery', emoji);
        let newUri2 = newUri1.addQueryValue('recovery', emoji);
        let newUri3 = newUri2.addQueryValue('recovery', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?recovery=%F0%9F%94%83');
        expect(newUri2.toString()).assertEqual('http://test.com?recovery=%F0%9F%94%83&recovery=%F0%9F%94%83');
        expect(newUri3.toString())
          .assertEqual('http://test.com?recovery=%F0%9F%94%83&recovery=%F0%9F%94%83&recovery=%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4500
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('maple leaf', emoji);
        let newUri2 = newUri1.addQueryValue('maple leaf', emoji);
        let newUri3 = newUri2.addQueryValue('maple leaf', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?maple%20leaf=%F0%9F%8D%81');
        expect(newUri2.toString()).assertEqual('http://test.com?maple%20leaf=%F0%9F%8D%81&maple%20leaf=%F0%9F%8D%81');
        expect(newUri3.toString())
          .assertEqual('http://test.com?maple%20leaf=%F0%9F%8D%81&maple%20leaf=%F0%9F%8D%81&maple%20leaf=%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4600
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0010";
      try {
        let emoji = '\u2666';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('rhombus', emoji);
        let newUri2 = newUri1.addQueryValue('rhombus', emoji);
        let newUri3 = newUri2.addQueryValue('rhombus', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?rhombus=%E2%99%A6');
        expect(newUri2.toString()).assertEqual('http://test.com?rhombus=%E2%99%A6&rhombus=%E2%99%A6');
        expect(newUri3.toString()).assertEqual('http://test.com?rhombus=%E2%99%A6&rhombus=%E2%99%A6&rhombus=%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4700
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('prod', emoji);
        let newUri2 = newUri1.addQueryValue('prod', emoji);
        let newUri3 = newUri2.addQueryValue('prod', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?prod=%F0%9F%91%88');
        expect(newUri2.toString()).assertEqual('http://test.com?prod=%F0%9F%91%88&prod=%F0%9F%91%88');
        expect(newUri3.toString()).assertEqual('http://test.com?prod=%F0%9F%91%88&prod=%F0%9F%91%88&prod=%F0%9F%91%88');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddQueryValueEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4800
     * @tc.desc   Testing the Uri interface AddQueryValue with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddQueryValueEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddQueryValueEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addQueryValue('handshake', emoji);
        let newUri2 = newUri1.addQueryValue('handshake', emoji);
        let newUri3 = newUri2.addQueryValue('handshake', emoji);
        expect(newUri1.toString()).assertEqual('http://test.com?handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri2.toString())
          .assertEqual('http://test.com?handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F&handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri3.toString())
          .assertEqual('http://test.com?handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F&handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F&handshake=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_4900
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%98%8A');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%98%8A/%F0%9F%98%8A');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%98%8A/%F0%9F%98%8A/%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5000
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%A4');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%A4/%F0%9F%91%A4');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%A4/%F0%9F%91%A4/%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5100
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%AB');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%AB/%F0%9F%91%AB');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%AB/%F0%9F%91%AB/%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5200
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0004";
      try {
        let emoji = '\u260e';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%E2%98%8E');
        expect(newUri2.toString()).assertEqual('http://test.com/%E2%98%8E/%E2%98%8E');
        expect(newUri3.toString()).assertEqual('http://test.com/%E2%98%8E/%E2%98%8E/%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5300
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%B9');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%B9/%F0%9F%91%B9');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%B9/%F0%9F%91%B9/%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5400
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%95%9B');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%95%9B/%F0%9F%95%9B');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%95%9B/%F0%9F%95%9B/%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5500
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%8D%8F');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%8D%8F/%F0%9F%8D%8F');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%8D%8F/%F0%9F%8D%8F/%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5600
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%94%83');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%94%83/%F0%9F%94%83');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%94%83/%F0%9F%94%83/%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5700
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%8D%81');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%8D%81/%F0%9F%8D%81');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%8D%81/%F0%9F%8D%81/%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5800
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0010";
      try {
        let emoji = '\u2666';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%E2%99%A6');
        expect(newUri2.toString()).assertEqual('http://test.com/%E2%99%A6/%E2%99%A6');
        expect(newUri3.toString()).assertEqual('http://test.com/%E2%99%A6/%E2%99%A6/%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_5900
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%88');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%88/%F0%9F%91%88');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%88/%F0%9F%91%88/%F0%9F%91%88');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddSegmentEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6000
     * @tc.desc   Testing the Uri interface AddSegment with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddSegmentEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddSegmentEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let baseUri = new uri.URI('http://test.com');
        let newUri1 = baseUri.addSegment(emoji);
        let newUri2 = newUri1.addSegment(emoji);
        let newUri3 = newUri2.addSegment(emoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri2.toString())
          .assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri3.toString())
          .assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6100
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0001";
      try {
        let emoji = '\ud83d\ude0a';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%98%8A');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%98%8A/%F0%9F%98%8A');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%98%8A/%F0%9F%98%8A/%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6200
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0002";
      try {
        let emoji = '\ud83d\udc64';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%A4');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%A4/%F0%9F%91%A4');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%A4/%F0%9F%91%A4/%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6300
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0003";
      try {
        let emoji = '\ud83d\udc6b';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%AB');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%AB/%F0%9F%91%AB');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%AB/%F0%9F%91%AB/%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6400
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0004";
      try {
        let emoji = '\u260e';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%E2%98%8E');
        expect(newUri2.toString()).assertEqual('http://test.com/%E2%98%8E/%E2%98%8E');
        expect(newUri3.toString()).assertEqual('http://test.com/%E2%98%8E/%E2%98%8E/%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6500
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0005";
      try {
        let emoji = '\ud83d\udc79';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%B9');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%B9/%F0%9F%91%B9');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%B9/%F0%9F%91%B9/%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6600
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0006";
      try {
        let emoji = '\ud83d\udd5b';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%95%9B');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%95%9B/%F0%9F%95%9B');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%95%9B/%F0%9F%95%9B/%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6700
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0007";
      try {
        let emoji = '\ud83c\udf4f';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%8D%8F');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%8D%8F/%F0%9F%8D%8F');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%8D%8F/%F0%9F%8D%8F/%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6800
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0008";
      try {
        let emoji = '\ud83d\udd03';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%94%83');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%94%83/%F0%9F%94%83');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%94%83/%F0%9F%94%83/%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_6900
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0009";
      try {
        let emoji = '\ud83c\udf41';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%8D%81');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%8D%81/%F0%9F%8D%81');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%8D%81/%F0%9F%8D%81/%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7000
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0010";
      try {
        let emoji = '\u2666';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%E2%99%A6');
        expect(newUri2.toString()).assertEqual('http://test.com/%E2%99%A6/%E2%99%A6');
        expect(newUri3.toString()).assertEqual('http://test.com/%E2%99%A6/%E2%99%A6/%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7100
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0011";
      try {
        let emoji = '\ud83d\udc48';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%91%88');
        expect(newUri2.toString()).assertEqual('http://test.com/%F0%9F%91%88/%F0%9F%91%88');
        expect(newUri3.toString()).assertEqual('http://test.com/%F0%9F%91%88/%F0%9F%91%88/%F0%9F%91%88');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIAddEncodedSegmentEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7200
     * @tc.desc   Testing the Uri interface AddEncodedSegment with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIAddEncodedSegmentEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIAddEncodedSegmentEmoji0012";
      try {
        let emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let baseUri = new uri.URI('http://test.com');
        let encodedEmoji = encodeURIComponent(emoji);
        let newUri1 = baseUri.addEncodedSegment(encodedEmoji);
        let newUri2 = newUri1.addEncodedSegment(encodedEmoji);
        let newUri3 = newUri2.addEncodedSegment(encodedEmoji);
        expect(newUri1.toString()).assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri2.toString())
          .assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
        expect(newUri3.toString())
          .assertEqual('http://test.com/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7300
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("😊,😊");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7400
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("👤,👤");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7500
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("👫,👫");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7600
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0004";
      try {
        const emoji = "\u260e";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("☎,☎");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7700
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("👹,👹");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7800
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("🕛,🕛");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_7900
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("🍏,🍏");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8000
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("🔃,🔃");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8100
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("🍁,🍁");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8200
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0010";
      try {
        const emoji = "\u2666";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("♦,♦");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8300
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("👈,👈");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetQueryValuesEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8400
     * @tc.desc   Test the function of the interface getQueryValues() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetQueryValuesEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetQueryValuesEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let uriInstance = new uri.URI(`https://www.test.com/search?emoji=${emoji}&emoji=${emoji}`);
        let buf1 = uriInstance.getQueryValues("emoji");
        expect(buf1.toString()).assertEqual("🤼‍♂️,🤼‍♂️");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8500
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8600
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8700
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8800
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0004";
      try {
        const emoji = "\u260e";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_8900
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9000
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9100
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9200
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9300
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9400
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0010";
      try {
        const emoji = "\u2666";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9500
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUriGetBooleanQueryValueEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9600
     * @tc.desc   Test the function of the interface getBooleanQueryValue() with Emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValueEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUriGetBooleanQueryValueEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let uriInstance = new uri.URI(`https://www.test.com/search?${emoji}=true`);
        let buf1 = uriInstance.getBooleanQueryValue(emoji, false);
        expect(buf1.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9700
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0001";
      try {
        let temp = "\ud83d\ude0a";
        let uriString = "content://com.test.hello/files/" + temp;
        let uriInstance = new uri.URI(uriString);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9800
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0002";
      try {
        let temp = "\ud83d\udc64";
        let uriInstance = new uri.URI("content://com.test.hello/files/" + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_9900
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0003";
      try {
        let temp = "\ud83d\udc6b";
        let uriInstance = new uri.URI("content://com.test.hello/files/" + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10000
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0004";
      try {
        let temp = "\u260e";
        let uriInstance = new uri.URI("content://com.test.hello/test/" + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10100
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0005";
      try {
        let temp = "\ud83d\udc79";
        let uriInstance = new uri.URI("content://com.test.hello/test/" + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10200
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0006";
      try {
        let temp = "\ud83d\udd5b";
        let uriString = "content://com.test.hello/test/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10300
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0007";
      try {
        let temp = "\ud83c\udf4f";
        let uriString = "content://com.test.hello/test/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10400
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0008";
      try {
        let temp = "\ud83d\udd03";
        let uriString = "content://com.test.hello/test/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10500
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji0900";
      try {
        let temp = "\ud83c\udf41";
        let uriString = "content://com.test.hello/emoji/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji00010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10600
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji00010";
      try {
        let temp = '\u2666';
        let uriString = "content://com.test.hello/test/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji00011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10700
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji00011";
      try {
        let temp = "\ud83d\udc48";
        let uriString = "content://com.test.hello/emoji/" + temp;
        let uriInstance = new uri.URI(uriString);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetLastSegmentEmoji00012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10800
     * @tc.desc   Testing the Uri interface GetLastSegment with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetLastSegmentEmoji00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetLastSegmentEmoji00012";
      try {
        let temp = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let uriString = "content://com.test.hello/emoji/";
        let uriInstance = new uri.URI(uriString + temp);
        console.log(`+++(${uriInstance.getLastSegment()})`);
        let lastSegment = uriInstance.getLastSegment();
        expect(lastSegment).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_10900
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0001";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\ude0a");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11000
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0002";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udc64");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11100
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0003";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udc6b");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11200
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0004";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\u260e");
        console.info(uriInstance.getSegment().toString());
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11300
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0005";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udc79");
        console.info(uriInstance.getSegment().toString());
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11400
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0006";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udd5b");
        console.info(uriInstance.getSegment().toString());
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11500
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0007";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83c\udf4f");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11600
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0008";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udd03");
        console.info(uriInstance.getSegment().toString());
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11700
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0009";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83c\udf41");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11800
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0010";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\u2666");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_11900
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0011";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83d\udc48");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURIGetSegmentEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12000
     * @tc.desc   Testing the Uri interface GetSegment with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURIGetSegmentEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURIGetSegmentEmoji0012";
      try {
        const uriInstance = new uri.URI("http://www.test.com/path/to/\ud83e\udd3c\u200d\u2642\ufe0f");
        console.info(uriInstance.getSegment().toString()); // path,to,image.jpg
        console.log(`+++(${uriInstance.getSegment().toString()})`);
        let EverySegment = uriInstance.getSegment().toString();
        expect(EverySegment).assertEqual('path,to,🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12100
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0001";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\ude0a");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12200
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0002";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udc64");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12300
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0003";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udc6b");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12400
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0004";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\u260e");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12500
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0005";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udc79");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12600
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0006";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udd5b");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12700
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0007";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83c\udf4f");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12800
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0008";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udd03");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_12900
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0009";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83c\udf41");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_13000
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0010";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\u2666");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_13100
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0011";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83d\udc48");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%91%88');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testURICreateFromPartsEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_13200
     * @tc.desc   Testing the Uri interface CreateFromParts with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURICreateFromPartsEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURICreateFromPartsEmoji0012";
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "\ud83e\udd3c\u200d\u2642\ufe0f");
        console.info(uriInstance.toString());
        console.log(`+++(${uriInstance.toString()})`);
        let CreateFrom = uriInstance.toString();
        expect(CreateFrom).assertEqual('mailto:no%20body#%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}