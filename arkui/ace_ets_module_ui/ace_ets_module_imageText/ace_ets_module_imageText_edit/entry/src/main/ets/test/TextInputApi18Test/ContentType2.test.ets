/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function ContentTypeTest2() {
  describe('ContentTypeTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("ContentTypeTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi18/ContentType2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContentTypeTest2 state pages: " + JSON.stringify(pages));
        if (!("ContentType2" == pages.name)) {
          console.info("get ContentTypeTest2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContentTypeTest2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContentTypeTest2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   ContentTypeTest2_0010
     * @tc.number SUB_ACE_ContentTypeTest2_0010
     * @tc.desc   set textInput ContentType: FLIGHT_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_FLIGHT_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.FLIGHT_NUMBER');
      console.info('[ContentTypeTest2_0010] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0020
     * @tc.number SUB_ACE_ContentTypeTest2_0020
     * @tc.desc   set textInput ContentType: LICENSE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_LICENSE_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.LICENSE_NUMBER');
      console.info('[ContentTypeTest2_0020] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0030
     * @tc.number SUB_ACE_ContentTypeTest2_0030
     * @tc.desc   set textInput ContentType: LICENSE_FILE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0030',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_LICENSE_FILE_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.LICENSE_FILE_NUMBER');
      console.info('[ContentTypeTest2_0030] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0040
     * @tc.number SUB_ACE_ContentTypeTest2_0040
     * @tc.desc   set textInput ContentType: LICENSE_PLATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_LICENSE_PLATE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.LICENSE_PLATE');
      console.info('[ContentTypeTest2_0040] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0050
     * @tc.number SUB_ACE_ContentTypeTest2_0050
     * @tc.desc   set textInput ContentType: ENGINE_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0050',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_ENGINE_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0050] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.ENGINE_NUMBER');
      console.info('[ContentTypeTest2_0050] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0060
     * @tc.number SUB_ACE_ContentTypeTest2_0060
     * @tc.desc   set textInput ContentType: LICENSE_CHASSIS_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0060',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0060 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_LICENSE_CHASSIS_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0060] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.LICENSE_CHASSIS_NUMBER');
      console.info('[ContentTypeTest2_0060] END');
      done();
    });

    /**
     * @tc.name   ContentTypeTest2_0070
     * @tc.number SUB_ACE_ContentTypeTest2_0070
     * @tc.desc   set Illegal value about textInput ContentType: UNDEFINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContentTypeTest2_0070',  Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest2_0070 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_UNDEFINED');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.UNSPECIFIED');
      console.info('[ContentTypeTest2_0070] END');
      done();
    });
  })
}

