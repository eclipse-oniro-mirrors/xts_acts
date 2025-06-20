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
import { url } from '@kit.ArkTS';

export default function Url_Emoji_append_get() {
  describe('Url_Emoji_append_get', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLAppendEmoji0001
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\ude0a', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%98%8A=3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLAppendEmoji0002
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udc64', '2');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%91%A4=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLAppendEmoji0003
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udc6b', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%91%AB=3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLAppendEmoji0004
     * @tc.desc       : Testing the Url interface Append with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\u260e', '4');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%E2%98%8E=4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLAppendEmoji0005
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udc79', '5');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%91%B9=5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLAppendEmoji0006
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udd5b', '6');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%95%9B=6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLAppendEmoji0007
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83c\udf4f', '7');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%8D%8F=7");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLAppendEmoji0008
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udd03', '8');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%94%83=8");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLAppendEmoji0009
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83c\udf41', '9');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%8D%81=9");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLAppendEmoji0010
     * @tc.desc       : Testing the Url interface Append with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\u2666', '10');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%E2%99%A6=10");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLAppendEmoji0011
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83d\udc48', '11');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%91%88=11");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLAppendEmoji0012
     * @tc.desc       : Testing the Url interface Append with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLAppendEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLAppendEmoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\ud83e\udd3c\u200d\u2642\ufe0f', '12');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F=12");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLDelete9Emoji0001
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\ude0a=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\ude0a');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLDelete9Emoji0002
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc64=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udc64');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLDelete9Emoji0003
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc6b=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udc6b');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLDelete9Emoji0004
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u260e=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\u260e');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLDelete9Emoji0005
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc79=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udc79');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLDelete9Emoji0006
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd5b=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udd5b');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLDelete9Emoji0007
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf4f=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83c\udf4f');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLDelete9Emoji0008
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd03=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udd03');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLDelete9Emoji0009
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf41=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83c\udf41');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLDelete9Emoji0010
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u2666=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\u2666');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLDelete9Emoji0011
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc48=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83d\udc48');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLDelete9Emoji0012
     * @tc.desc       : Testing the Url interface Delete9+ with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLDelete9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLDelete9Emoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83e\udd3c\u200d\u2642\ufe0f=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\ud83e\udd3c\u200d\u2642\ufe0f');
        expect(paramsObject.toString()).assertEqual("bard=2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLGetAll9Emoji0001
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\ude0a=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\ude0a', '3');
        expect(params.getAll('\ud83d\ude0a').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLGetAll9Emoji0002
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc64=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc64', '3');
        expect(params.getAll('\ud83d\udc64').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLGetAll9Emoji0003
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc6b=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc6b', '3');
        expect(params.getAll('\ud83d\udc6b').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLGetAll9Emoji0004
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u260e=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\u260e', '3');
        expect(params.getAll('\u260e').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLGetAll9Emoji0005
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc79=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc79', '3');
        expect(params.getAll('\ud83d\udc79').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLGetAll9Emoji0006
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd5b=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udd5b', '3');
        expect(params.getAll('\ud83d\udd5b').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLGetAll9Emoji0007
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf4f=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83c\udf4f', '3');
        expect(params.getAll('\ud83c\udf4f').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLGetAll9Emoji0008
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd03=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udd03', '3');
        expect(params.getAll('\ud83d\udd03').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLGetAll9Emoji0009
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf41=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83c\udf41', '3');
        expect(params.getAll('\ud83c\udf41').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLGetAll9Emoji0010
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u2666=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\u2666', '3');
        expect(params.getAll('\u2666').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLGetAll9Emoji0011
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc48=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc48', '3');
        expect(params.getAll('\ud83d\udc48').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLGetAll9Emoji0012
     * @tc.desc       : Testing the Url interface GetAll9 with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGetAll9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGetAll9Emoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83e\udd3c\u200d\u2642\ufe0f=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83e\udd3c\u200d\u2642\ufe0f', '3');
        expect(params.getAll('\ud83e\udd3c\u200d\u2642\ufe0f').toString()).assertEqual("1,3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLEntries9Emoji0001
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0001";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\ude0a&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\ude0a; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLEntries9Emoji0002
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0002";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udc64&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udc64; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLEntries9Emoji0003
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0003";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udc6b&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udc6b; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLEntries9Emoji0004
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0004";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\u260e&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \u260e; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLEntries9Emoji0005
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0005";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udc79&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udc79; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLEntries9Emoji0006
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0006";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udd5b&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udd5b; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLEntries9Emoji0007
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0007";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83c\udf4f&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83c\udf4f; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLEntries9Emoji0008
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0008";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udd03&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udd03; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLEntries9Emoji0009
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0009";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83c\udf41&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83c\udf41; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLEntries9Emoji0010
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0010";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\u2666&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \u2666; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLEntries9Emoji0011
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0011";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83d\udc48&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83d\udc48; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLEntries9Emoji0012
     * @tc.desc       : Testing the Url interface Entries9 with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLEntries9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLEntries9Emoji0012";
      try {
        let searchParamsObject = new url.URLParams("keyName1=\ud83e\udd3c\u200d\u2642\ufe0f&keyName2=valueName2");
        let pair: Iterable<Object[]> = searchParamsObject.entries();
        let arrayValue = Array.from(pair);
        let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
        let expectedString = "keyName1, \ud83e\udd3c\u200d\u2642\ufe0f; keyName2, valueName2";
        expect(resultString).assertEqual(expectedString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLForEachEmoji0001
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0001";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\ude0a');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\ude0a";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLForEachEmoji0002
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0002";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udc64');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udc64";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLForEachEmoji0003
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0003";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udc6b');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udc6b";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLForEachEmoji0004
     * @tc.desc       : Testing the Url interface ForEach with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0004";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\u260e');
        const expectedKey = "emoji";
        const expectedValue = "\u260e";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLForEachEmoji0005
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0005";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udc79');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udc79";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLForEachEmoji0006
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0006";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udd5b');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udd5b";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLForEachEmoji0007
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0007";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83c\udf4f');
        const expectedKey = "emoji";
        const expectedValue = "\ud83c\udf4f";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLForEachEmoji0008
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0008";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udd03');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udd03";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLForEachEmoji0009
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0009";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83c\udf41');
        const expectedKey = "emoji";
        const expectedValue = "\ud83c\udf41";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLForEachEmoji0010
     * @tc.desc       : Testing the Url interface ForEach with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0010";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\u2666');
        const expectedKey = "emoji";
        const expectedValue = "\u2666";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLForEachEmoji0011
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0011";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83d\udc48');
        const expectedKey = "emoji";
        const expectedValue = "\ud83d\udc48";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLForEachEmoji0012
     * @tc.desc       : Testing the Url interface ForEach with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLForEachEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLForEachEmoji0012";
      try {
        const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?emoji=\ud83e\udd3c\u200d\u2642\ufe0f');
        const expectedKey = "emoji";
        const expectedValue = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let callbackInvoked = false;
        myURLObject.params.forEach((value, key, searchParams) => {
          expect(key).assertEqual(expectedKey);
          expect(value).assertEqual(expectedValue);
          expect(myURLObject.params === searchParams).assertEqual(true);
          callbackInvoked = true;
        });
        expect(callbackInvoked).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLGet9Emoji0001
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0001";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\ude0a');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\ude0a");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLGet9Emoji0002
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0002";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udc64');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udc64");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLGet9Emoji0003
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0003";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udc6b');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udc6b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLGet9Emoji0004
     * @tc.desc       : Testing the Url interface Get9 with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0004";
      try {
        let paramsObject = new url.URLParams('emoji=\u260e');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\u260e");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLGet9Emoji0005
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0005";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udc79');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udc79");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLGet9Emoji0006
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0006";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udd5b');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udd5b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLGet9Emoji0007
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0007";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83c\udf4f');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83c\udf4f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLGet9Emoji0008
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0008";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udd03');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udd03");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLGet9Emoji0009
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0009";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83c\udf41');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83c\udf41");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLGet9Emoji0010
     * @tc.desc       : Testing the Url interface Get9 with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0010";
      try {
        let paramsObject = new url.URLParams('emoji=\u2666');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\u2666");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLGet9Emoji0011
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0011";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83d\udc48');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83d\udc48");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLGet9Emoji0012
     * @tc.desc       : Testing the Url interface Get9 with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLGet9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLGet9Emoji0012";
      try {
        let paramsObject = new url.URLParams('emoji=\ud83e\udd3c\u200d\u2642\ufe0f');
        expect(paramsObject.get("emoji")?.toString()).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testURLParamsHas9Emoji0001
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\ude0a=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\ude0a');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testURLParamsHas9Emoji0002
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc64=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udc64');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testURLParamsHas9Emoji0003
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc6b=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udc6b');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testURLParamsHas9Emoji0004
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u260e=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\u260e');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testURLParamsHas9Emoji0005
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc79=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udc79');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testURLParamsHas9Emoji0006
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd5b=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udd5b');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testURLParamsHas9Emoji0007
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf4f=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83c\udf4f');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_000
     * @tc.name       : testURLParamsHas9Emoji0008
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udd03=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udd03');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testURLParamsHas9Emoji0009
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83c\udf41=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83c\udf41');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testURLParamsHas9Emoji0010
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\u2666=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\u2666');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testURLParamsHas9Emoji0011
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83d\udc48=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83d\udc48');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testURLParamsHas9Emoji0012
     * @tc.desc       : Testing the Uri interface ParamsHas with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsHas9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsHas9Emoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?\ud83e\udd3c\u200d\u2642\ufe0f=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\ud83e\udd3c\u200d\u2642\ufe0f');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testURLParamsSet9Emoji0001
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\ude0a', '😊');
        expect(paramsObject.get('\ud83d\ude0a')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testURLParamsSet9Emoji0002
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udc64', '👤');
        expect(paramsObject.get('\ud83d\udc64')).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testURLParamsSet9Emoji0003
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udc6b', '👫');
        expect(paramsObject.get('\ud83d\udc6b')).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testURLParamsSet9Emoji0004
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\u260e', '☎');
        expect(paramsObject.get('\u260e')).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testURLParamsSet9Emoji0005
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udc79', '👹');
        expect(paramsObject.get('\ud83d\udc79')).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testURLParamsSet9Emoji0006
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udd5b', '🕛');
        expect(paramsObject.get('\ud83d\udd5b')).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testURLParamsSet9Emoji0007
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83c\udf4f', '🍏');
        expect(paramsObject.get('\ud83c\udf4f')).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.name       : testURLParamsSet9Emoji0008
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udd03', '🔃');
        expect(paramsObject.get('\ud83d\udd03')).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testURLParamsSet9Emoji0009
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83c\udf41', '🍁');
        expect(paramsObject.get('\ud83c\udf41')).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testURLParamsSet9Emoji0010
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\u2666', '♦');
        expect(paramsObject.get('\u2666')).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testURLParamsSet9Emoji0011
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83d\udc48', '👈');
        expect(paramsObject.get('\ud83d\udc48')).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testURLParamsSet9Emoji0012
     * @tc.desc       : Testing the Uri interface ParamsSet with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsSet9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsSet9Emoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\ud83e\udd3c\u200d\u2642\ufe0f', '🤼‍♂️');
        expect(paramsObject.get('\ud83e\udd3c\u200d\u2642\ufe0f')).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testURLParamsKeys9Emoji0001
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0001";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udc64&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testURLParamsKeys9Emoji0002
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0002";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udc64&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testURLParamsKeys9Emoji0003
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0003";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udc6b&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testURLParamsKeys9Emoji0004
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0004";
      try {
        let searchParamsObject = new url.URLParams("emoji=\u260e&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testURLParamsKeys9Emoji0005
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0005";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udc79&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testURLParamsKeys9Emoji0006
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0006";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udd5b&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testURLParamsKeys9Emoji0007
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0007";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83c\udf4f&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.name       : testURLParamsKeys9Emoji0008
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0008";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udd03&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testURLParamsKeys9Emoji0009
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0009";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83c\udf41&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testURLParamsKeys9Emoji0010
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0010";
      try {
        let searchParamsObject = new url.URLParams("emoji=\u2666&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testURLParamsKeys9Emoji0011
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0011";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83d\udc48&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testURLParamsKeys9Emoji0012
     * @tc.desc       : Testing the Uri interface ParamsKeys with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsKeys9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsKeys9Emoji0012";
      try {
        let searchParamsObject = new url.URLParams("emoji=\ud83e\udd3c\u200d\u2642\ufe0f&key1=value1");
        let keys = Array.from(searchParamsObject.keys());
        console.log(`+++${keys}`);
        expect(keys.toString()).assertEqual("emoji,key1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testURLParamsValues9Emoji0001
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0001";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\ude0a&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("😊,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testURLParamsValues9Emoji0002
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0002";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udc64&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("👤,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testURLParamsValues9Emoji0003
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0003";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udc6b&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("👫,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testURLParamsValues9Emoji0004
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0004";
      try {
        let searchParams = new url.URLParams("key1=\u260e&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("☎,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testURLParamsValues9Emoji0005
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0005";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udc79&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("👹,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testURLParamsValues9Emoji0006
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0006";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udd5b&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("🕛,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testURLParamsValues9Emoji0007
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0007";
      try {
        let searchParams = new url.URLParams("key1=\ud83c\udf4f&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("🍏,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.name       : testURLParamsValues9Emoji0008
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0008";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udd03&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("🔃,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testURLParamsValues9Emoji0009
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0009";
      try {
        let searchParams = new url.URLParams("key1=\ud83c\udf41&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("🍁,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testURLParamsValues9Emoji0010
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0010";
      try {
        let searchParams = new url.URLParams("key1=\u2666&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("♦,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testURLParamsValues9Emoji0011
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0011";
      try {
        let searchParams = new url.URLParams("key1=\ud83d\udc48&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("👈,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testURLParamsValues9Emoji0012
     * @tc.desc       : Testing the Uri interface ParamsValues with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsValues9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsValues9Emoji0012";
      try {
        let searchParams = new url.URLParams("key1=\ud83e\udd3c\u200d\u2642\ufe0f&key2=value2");
        let values = Array.from(searchParams.values());
        console.log(`+++${values}`);
        expect(values.toString()).assertEqual("🤼‍♂️,value2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testURLParamsToString9Emoji0001
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0001";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\ude0a', '😊');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%98%8A=%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testURLParamsToString9Emoji0002
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0002";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc64', '👤');
        console.log(`===(${params.toString()})`)
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%91%A4=%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testURLParamsToString9Emoji0003
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0003";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc6b', '👫');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%91%AB=%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testURLParamsToString9Emoji0004
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0004";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\u260e', '☎');
        expect(params.toString()).assertEqual('fod=1&bard=2&%E2%98%8E=%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testURLParamsToString9Emoji0005
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0005";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc79', '👹');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%91%B9=%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testURLParamsToString9Emoji0006
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0006";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udd5b', '🕛');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%95%9B=%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testURLParamsToString9Emoji0007
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0007";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83c\udf4f', '🍏');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%8D%8F=%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.name       : testURLParamsToString9Emoji0008
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0008";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udd03', '🔃');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%94%83=%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testURLParamsToString9Emoji0009
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0009";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83c\udf41', '🍁');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%8D%81=%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testURLParamsToString9Emoji0010
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0010";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\u2666', '♦');
        expect(params.toString()).assertEqual('fod=1&bard=2&%E2%99%A6=%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testURLParamsToString9Emoji0011
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0011";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83d\udc48', '👈️');
        expect(params.toString()).assertEqual('fod=1&bard=2&%F0%9F%91%88=%F0%9F%91%88%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testURLParamsToString9Emoji0012
     * @tc.desc       : Testing the Uri interface ParamsToString9 with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLParamsToString9Emoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLParamsToString9Emoji0012";
      try {
        let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new url.URLParams(urlObject.search.slice(1));
        params.append('\ud83e\udd3c\u200d\u2642\ufe0f', '🤼‍♂️');
        expect(params.toString())
          .assertEqual('fod=1&bard=2&%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F=%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0100
     * @tc.name       : testUrLParseURLEmoji0001
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0001";
      try {
        let urlString1 = '\ud83d\ude0a/path2';
        let urlString2 = '/\ud83d\ude0a/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%98%8A/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0200
     * @tc.name       : testUrLParseURLEmoji0002
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0002";
      try {
        let url3 = url.URL.parseURL('/\ud83d\ude0a/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0300
     * @tc.name       : testUrLParseURLEmoji0003
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0003";
      try {
        let urlString1 = '\ud83d\udc64/path2';
        let urlString2 = '/\ud83d\udc64/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp = '%F0%9F%91%A4/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;

        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0400
     * @tc.name       : testUrLParseURLEmoji0004
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0004";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udc64/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0500
     * @tc.name       : testUrLParseURLEmoji0005
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0005";
      try {
        let urlString1 = '\ud83d\udc6b/path2';
        let urlString2 = '/\ud83d\udc6b/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%91%AB/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0600
     * @tc.name       : testUrLParseURLEmoji0006
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0006";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udc6b/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0700
     * @tc.name       : testUrLParseURLEmoji0007
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0007";
      try {
        let urlString1 = '\u260e/path2';
        let urlString2 = '/\u260e/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%E2%98%8E/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0800
     * @tc.name       : testUrLParseURLEmoji0008
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0008";
      try {
        let url3 = url.URL.parseURL('/\u260e/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_0900
     * @tc.name       : testUrLParseURLEmoji0009
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0009";
      try {
        let urlString1 = '\ud83d\udc79/path2';
        let urlString2 = '/\ud83d\udc79/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%91%B9/path2';
        expect(url1.toString()).assertEqual('https://www.example.com/test/' + temp);
        expect(url2.toString()).assertEqual('https://www.example.com/' + temp);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1000
     * @tc.name       : testUrLParseURLEmoji0010
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0010";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udc79/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1100
     * @tc.name       : testUrLParseURLEmoji0011
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0011";
      try {
        let emojiString1 = '\ud83d\udd5b/path2';
        let emojiString2 = '/\ud83d\udd5b/path2';
        let url1 = url.URL.parseURL(emojiString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(emojiString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%95%9B/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1200
     * @tc.name       : testUrLParseURLEmoji0012
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0012";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udd5b/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1300
     * @tc.name       : testUrLParseURLEmoji0013
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0013";
      try {
        let urlString1 = '\ud83c\udf4f/path2';
        let urlString2 = '/\ud83c\udf4f/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%8D%8F/path2';
        expect(url1.toString()).assertEqual('https://www.example.com/test/' + temp);
        expect(url2.toString()).assertEqual('https://www.example.com/' + temp);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1400
     * @tc.name       : testUrLParseURLEmoji0014
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0014";
      try {
        let url3 = url.URL.parseURL('/\ud83c\udf4f/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1500
     * @tc.name       : testUrLParseURLEmoji0015
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0015";
      try {
        let urlString1 = '\ud83d\udd03/path2';
        let urlString2 = '/\ud83d\udd03/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%94%83/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1600
     * @tc.name       : testUrLParseURLEmoji0016
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0016";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udd03/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1700
     * @tc.name       : testUrLParseURLEmoji0017
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0017";
      try {
        let urlString1 = '\ud83c\udf41/path2';
        let urlString2 = '/\ud83c\udf41/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%8D%81/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1800
     * @tc.name       : testUrLParseURLEmoji0018
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0018";
      try {
        let url3 = url.URL.parseURL('/\ud83c\udf41/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_1900
     * @tc.name       : testUrLParseURLEmoji0019
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0019";
      try {
        let urlString1 = '\u2666/path2';
        let urlString2 = '/\u2666/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%E2%99%A6/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_2000
     * @tc.name       : testUrLParseURLEmoji0020
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0020";
      try {
        let url3 = url.URL.parseURL('/\u2666/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_2100
     * @tc.name       : testUrLParseURLEmoji0021
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0021";
      try {
        let urlString1 = '\ud83d\udc48/path2';
        let urlString2 = '/\ud83d\udc48/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp = '%F0%9F%91%88/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_2200
     * @tc.name       : testUrLParseURLEmoji0022
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0022";
      try {
        let url3 = url.URL.parseURL('/\ud83d\udc48/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_2300
     * @tc.name       : testUrLParseURLEmoji0023
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0023";
      try {
        let urlString1 = '/path2?emoji=\ud83e\udd3c\u200d\u2642\ufe0f';
        let urlString2 = '/\ud83e\udd3c\u200d\u2642\ufe0f/path2';
        let url1 = url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');

        let temp1 = 'path2?emoji=🤼‍♂️';
        let rstUrl1 = 'https://www.example.com/' + temp1;
        let temp2 = '%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F/path2';
        let rstUrl2 = 'https://www.example.com/' + temp2;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_EMOJI_2400
     * @tc.name       : testUrLParseURLEmoji0024
     * @tc.desc       : Testing the Url interface ParseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrLParseURLEmoji0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUrLParseURLEmoji0024";
      try {
        let url3 = url.URL.parseURL('/\ud83e\udd3c\u200d\u2642\ufe0f/path2', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0100
     * @tc.name       : testURLEmojiToString0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0001";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\ude0a');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%98%8A');

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0200
     * @tc.name       : testURLEmojiToString0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0002";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\udc64');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0300
     * @tc.name       : testURLEmojiToString0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0003";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\udc6b');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0400
     * @tc.name       : testURLEmojiToString0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0004";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\u260e');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0500
     * @tc.name       : testURLEmojiToString0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0005";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\udc79');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0600
     * @tc.name       : testURLEmojiToString0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0006";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\udd5b ');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0700
     * @tc.name       : testURLEmojiToString0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0007";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83c\udf4f');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0800
     * @tc.name       : testURLEmojiToString0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0008";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83d\udd03');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_0900
     * @tc.name       : testURLEmojiToString0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0009";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\ud83c\udf41');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_1000
     * @tc.name       : testURLEmojiToString0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0010";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/\u2666');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_1100
     * @tc.name       : testURLEmojiToString0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0012";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/\ud83e\udd3c\u200d\u2642\ufe0f');
        let result = urlObject.toString();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toString_1200
     * @tc.name       : testURLEmojiToString0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToString0012";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/\ud83e\udd3c\u200d\u2642\ufe0f');
        let result = urlObject.toString();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0100
     * @tc.name       : testURLEmojiToJson0001
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\ude0a  .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0001";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\ude0a');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%98%8A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0200
     * @tc.name       : testURLEmojiToJson0002
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc64  .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0002";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udc64');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%91%A4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0300
     * @tc.name       : testURLEmojiToJson0003
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc6b  .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0003";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udc6b');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%91%AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0400
     * @tc.name       : testURLEmojiToJson0004
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u260e  .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0004";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\u260e');
        let result = urlObject.toJSON();
        expect(result).assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%E2%98%8E');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0500
     * @tc.name       : testURLEmojiToJson0005
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc79.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0005";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udc79');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%91%B9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0600
     * @tc.name       : testURLEmojiToJson0006
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd5b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0006";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udd5b');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%95%9B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0700
     * @tc.name       : testURLEmojiToJson0007
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf4f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0007";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83c\udf4f');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%8D%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0800
     * @tc.name       : testURLEmojiToJson0008
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udd03.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0008";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udd03');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%94%83');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson0900
     * @tc.name       : testURLEmojiToJson0009
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83c\udf41.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0009";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83c\udf41');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%8D%81');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson1000
     * @tc.name       : testURLEmojiToJson0010
     * @tc.desc       : Testing the Url interface parseURL with input emoji \u2666.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0010";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\u2666');
        let result = urlObject.toJSON();
        expect(result).assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%E2%99%A6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson1100
     * @tc.name       : testURLEmojiToJson0011
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83d\udc48.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0011";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83d\udc48');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%91%88');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_emoji_toJson1200
     * @tc.name       : testURLEmojiToJson0012
     * @tc.desc       : Testing the Url interface parseURL with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURLEmojiToJson0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testURLEmojiToJson0012";
      try {
        const urlObject =
          url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da\ud83e\udd3c\u200d\u2642\ufe0f');
        let result = urlObject.toJSON();
        expect(result)
          .assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}