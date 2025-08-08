/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import  uri  from '@ohos.uri';
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function Uri_Emoji() {
  describe('Uri_Emoji', (): void => {
      afterEach(() => {
        await Utils.msSleep(20);
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0100
     * @tc.name       : testUriConstructorEmoji0001
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%98%8A");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0200
     * @tc.name       : testUriConstructorEmoji0002
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0002";
      try {
        const emoji = "\ud83d\udc64";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%A4");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0300
     * @tc.name       : testUriConstructorEmoji0003
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0003";
      try {
        const emoji = "\ud83d\udc6b";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%AB");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0400
     * @tc.name       : testUriConstructorEmoji0004
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0004";
      try {
        const emoji = "\u260e";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%E2%98%8E");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0500
     * @tc.name       : testUriConstructorEmoji0005
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0005";
      try {
        const emoji = "\ud83d\udc79";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%B9");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0600
     * @tc.name       : testUriConstructorEmoji0006
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0006";
      try {
        const emoji = "\ud83d\udd5b";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%95%9B");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0700
     * @tc.name       : testUriConstructorEmoji0007
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0007";
      try {
        const emoji = "\ud83c\udf4f";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%8D%8F");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0800
     * @tc.name       : testUriConstructorEmoji0008
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0008";
      try {
        const emoji = "\ud83d\udd03";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%94%83");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_0900
     * @tc.name       : testUriConstructorEmoji0009
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0009";
      try {
        const emoji = "\ud83c\udf41";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%8D%81");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1000
     * @tc.name       : testUriConstructorEmoji0010
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0010";
      try {
        const emoji = "\u2666";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%E2%99%A6");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1100
     * @tc.name       : testUriConstructorEmoji0011
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0011";
      try {
        const emoji = "\ud83d\udc48";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%91%88");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1200
     * @tc.name       : testUriConstructorEmoji0012
     * @tc.desc       : Testing the Uri interface Constructor with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriConstructorEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriConstructorEmoji0012";
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
        let mm = new uri.URI(emoji);
        expect(mm.toString()).assertEqual("%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1300
     * @tc.name       : testUriToStringEmoji0001
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0001";
      try {
        const emoji = "\ud83d\ude0a";
        let mm = new uri.URI(emoji);
        let result = mm.toString();
        expect(result).assertEqual("%F0%9F%98%8A");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1400
     * @tc.name       : testUriToStringEmoji0002
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0002"
      try {
        const emoji = "\ud83d\udc64"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%A4")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1500
     * @tc.name       : testUriToStringEmoji0003
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0003"
      try {
        const emoji = "\ud83d\udc6b"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%AB")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1600
     * @tc.name       : testUriToStringEmoji0004
     * @tc.desc       : Testing the Uri interface ToString with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0004"
      try {
        const emoji = "\u260e"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%E2%98%8E")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1700
     * @tc.name       : testUriToStringEmoji0005
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0005"
      try {
        const emoji = "\ud83d\udc79"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%B9")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1800
     * @tc.name       : testUriToStringEmoji0006
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0006"
      try {
        const emoji = "\ud83d\udd5b"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%95%9B")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_1900
     * @tc.name       : testUriToStringEmoji0007
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0007"
      try {
        const emoji = "\ud83c\udf4f"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%8D%8F")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2000
     * @tc.name       : testUriToStringEmoji0008
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0008"
      try {
        const emoji = "\ud83d\udd03"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%94%83")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2100
     * @tc.name       : testUriToStringEmoji0009
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0009"
      try {
        const emoji = "\ud83c\udf41"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%8D%81")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2200
     * @tc.name       : testUriToStringEmoji0010
     * @tc.desc       : Testing the Uri interface ToString with input emoji \u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0010"
      try {
        const emoji = "\u2666"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%E2%99%A6")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2300
     * @tc.name       : testUriToStringEmoji0011
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0011"
      try {
        const emoji = "\ud83d\udc48"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%91%88")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2400
     * @tc.name       : testUriToStringEmoji0012
     * @tc.desc       : Testing the Uri interface ToString with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriToStringEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriToStringEmoji0012"
      try {
        const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f"
        let mm = new uri.URI(emoji)
        let result = mm.toString()
        expect(result).assertEqual("%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F")
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2500
     * @tc.name       : testUriGetQueryValueEmoji0001
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0001"
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\ude0a&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\ude0a');
        hilog.info(1, TAG, '%{public}s', 'testUriGetQueryValueEmoji0001 jzl flag2 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\ude0a")
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\ude0a")
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null)
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`)
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2600
     * @tc.name       : testUriGetQueryValueEmoji0002
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0002";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc64&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc64');
        hilog.info(2, TAG, '%{public}s', 'testUriGetQueryValueEmoji0002 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc64");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc64");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2700
     * @tc.name       : testUriGetQueryValueEmoji0003
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udc6b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0003";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc6b&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc6b');
        hilog.info(3, TAG, '%{public}s', 'testUriGetQueryValueEmoji0003 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc6b");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc6b");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2800
     * @tc.name       : testUriGetQueryValueEmoji0004
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \u260e
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0004";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\u260e&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\u260e');
        hilog.info(4, TAG, '%{public}s', 'testUriGetQueryValueEmoji0004 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\u260e");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\u260e");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_2900
     * @tc.name       : testUriGetQueryValueEmoji0005
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udc79
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0005";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc79&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc79');
        hilog.info(5, TAG, '%{public}s', 'testUriGetQueryValueEmoji0005 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc79");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc79");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3000
     * @tc.name       : testUriGetQueryValueEmoji0006
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udd5b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0006";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udd5b&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udd5b');
        hilog.info(6, TAG, '%{public}s', 'testUriGetQueryValueEmoji0006 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udd5b");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udd5b");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3100
     * @tc.name       : testUriGetQueryValueEmoji0007
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83c\udf4f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0007";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83c\udf4f&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83c\udf4f');
        hilog.info(7, TAG, '%{public}s', 'testUriGetQueryValueEmoji0007 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83c\udf4f");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83c\udf4f");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3200
     * @tc.name       : testUriGetQueryValueEmoji0008
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udd03
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0008";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udd03&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udd03');
        hilog.info(8, TAG, '%{public}s', 'testUriGetQueryValueEmoji0008 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udd03");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udd03");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3300
     * @tc.name       : testUriGetQueryValueEmoji0009
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83c\udf41
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0009";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83c\udf41&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83c\udf41');
        hilog.info(9, TAG, '%{public}s', 'testUriGetQueryValueEmoji0009 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83c\udf41");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83c\udf41");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3400
     * @tc.name       : testUriGetQueryValueEmoji0010
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji '\u2666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0010";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\u2666&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\u2666');
        hilog.info(10, TAG, '%{public}s', 'testUriGetQueryValueEmoji0010 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\u2666");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\u2666");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3500
     * @tc.name       : testUriGetQueryValueEmoji0011
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83d\udc48
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0011";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83d\udc48&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83d\udc48');
        hilog.info(11, TAG, '%{public}s', 'testUriGetQueryValueEmoji0011 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83d\udc48");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83d\udc48");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3600
     * @tc.name       : testUriGetQueryValueEmoji0012
     * @tc.desc       : Testing the Uri interface GetQueryValue with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUriGetQueryValueEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUriGetQueryValueEmoji0012";
      try {
        const uriInstance = new uri.URI("https://www.com?param1=\ud83e\udd3c\u200d\u2642\ufe0f&param2=value2");
        let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=\ud83e\udd3c\u200d\u2642\ufe0f');
        hilog.info(12, TAG, '%{public}s', 'testUriGetQueryValueEmoji0012 jzl flag1 is:' + uriInstance1.getQueryValue('sa='));
        expect(uriInstance.getQueryValue("param1")).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(uriInstance1.getQueryValue('sa=')).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f");
        expect(uriInstance1.getQueryValue('abc')).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3700
     * @tc.name       : testURIAddQueryValueEmoji0001
     * @tc.desc       : Testing the Uri interface AddQueryValue with input emoji \ud83d\ude0a
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIAddQueryValueEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URI_EMOJI_3800
     * @tc.name       : testURIAddQueryValueEmoji0002
     * @tc.desc       : Testing the Uri interface AddQueryValue with input emoji \ud83d\udc64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testURIAddQueryValueEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
  })
}