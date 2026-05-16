/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function TextPrivacySensitive() {
  describe('ArkUIHDSPrivacySensitiveTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get privacySensitive state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get privacySensitive state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push privacySensitive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push privacySensitive page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUIHDS_Text_privacySensitive_0100
     * @tc.number ArkUIHDS_Text_privacySensitive_0100
     * @tc.desc   test text privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Text_privacySensitive_0100', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Text_privacySensitive_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Text_privacySensitive_0100');
          console.info('ArkUIHDS_Text_privacySensitive_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_0100 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertTrue();
          console.info('ArkUIHDS_Text_privacySensitive_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_0100 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Text_privacySensitive_0200
     * @tc.number ArkUIHDS_Text_privacySensitive_0200
     * @tc.desc   test text privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Text_privacySensitive_0200', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Text_privacySensitive_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Text_privacySensitive_0200');
          console.info('ArkUIHDS_Text_privacySensitive_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_0200 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_0200 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Text_privacySensitive_0300
     * @tc.number ArkUIHDS_Text_privacySensitive_0300
     * @tc.desc   test text privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Text_privacySensitive_0300', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Text_privacySensitive_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Text_privacySensitive_0300');
          console.info('ArkUIHDS_Text_privacySensitive_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_0300 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_0300 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Text_privacySensitive_0400
     * @tc.number ArkUIHDS_Text_privacySensitive_0400
     * @tc.desc   test text privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Text_privacySensitive_0400', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Text_privacySensitive_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Text_privacySensitive_0400');
          console.info('ArkUIHDS_Text_privacySensitive_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_0400 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_0400 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Image_privacySensitive_0100
     * @tc.number ArkUIHDS_Image_privacySensitive_0100
     * @tc.desc   test Image privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Image_privacySensitive_0100', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Image_privacySensitive_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Image_privacySensitive_0100');
          console.info('ArkUIHDS_Image_privacySensitive_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_0100 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertTrue();
          console.info('ArkUIHDS_Image_privacySensitive_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_0100 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Image_privacySensitive_0200
     * @tc.number ArkUIHDS_Image_privacySensitive_0200
     * @tc.desc   test Image privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Image_privacySensitive_0200', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Image_privacySensitive_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Image_privacySensitive_0200');
          console.info('ArkUIHDS_Image_privacySensitive_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_0200 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_0200 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Image_privacySensitive_0300
     * @tc.number ArkUIHDS_Image_privacySensitive_0300
     * @tc.desc   test Image privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Image_privacySensitive_0300', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Image_privacySensitive_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Image_privacySensitive_0300');
          console.info('ArkUIHDS_Image_privacySensitive_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_0300 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_0300 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUIHDS_Image_privacySensitive_0400
     * @tc.number ArkUIHDS_Image_privacySensitive_0400
     * @tc.desc   test Image privacySensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIHDS_Image_privacySensitive_0400', Level.LEVEL1, (done: Function) => {
      console.info('ArkUIHDS_Image_privacySensitive_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUIHDS_Image_privacySensitive_0400');
          console.info('ArkUIHDS_Image_privacySensitive_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_0400 component obj.$attrs.privacySensitive is: " +
          JSON.stringify(obj.$attrs.privacySensitive));
          expect(obj.$attrs.privacySensitive).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_0400 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });
  })
}