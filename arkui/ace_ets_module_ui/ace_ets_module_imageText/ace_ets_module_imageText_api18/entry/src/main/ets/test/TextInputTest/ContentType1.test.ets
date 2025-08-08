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
import { describe, beforeEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function ContentTypeTest1() {
  describe('ContentTypeTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("ContentTypeTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/ContentType1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContentTypeTest1 state pages: " + JSON.stringify(pages));
        if (!("ContentType1" == pages.name)) {
          console.info("get ContentTypeTest1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContentTypeTest1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContentTypeTest1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0010
     * @tc.name      ContentTypeTest1_0010
     * @tc.desc      set textInput ContentType: PASSPORT_NUMBER
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('ContentTypeTest1_0010', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_PASSPORT_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.PASSPORT_NUMBER');
      console.info('[ContentTypeTest1_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0020
     * @tc.name      ContentTypeTest1_0020
     * @tc.desc      set textInput ContentType: VALIDITY
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0020', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_VALIDITY');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.VALIDITY');
      console.info('[ContentTypeTest1_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0030
     * @tc.name      ContentTypeTest1_0030
     * @tc.desc      set textInput ContentType: ISSUE_AT
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0030', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_ISSUE_AT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.ISSUE_AT');
      console.info('[ContentTypeTest1_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0040
     * @tc.name      ContentTypeTest1_0040
     * @tc.desc      set textInput ContentType: ORGANIZATION
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0040', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_ORGANIZATION');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.ORGANIZATION');
      console.info('[ContentTypeTest1_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0050
     * @tc.name      ContentTypeTest1_0050
     * @tc.desc      set textInput ContentType: TAX_ID
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0050', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_TAX_ID');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0050] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.TAX_ID');
      console.info('[ContentTypeTest1_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0060
     * @tc.name      ContentTypeTest1_0060
     * @tc.desc      set textInput ContentType: ADDRESS_CITY_AND_STATE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0060', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0060 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_ADDRESS_CITY_AND_STATE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0060] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.ADDRESS_CITY_AND_STATE');
      console.info('[ContentTypeTest1_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest1_0070
     * @tc.name      ContentTypeTest1_0070
     * @tc.desc      test default value about textInput ContentType: DEFAULT
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest1_0070', 0, async (done: Function) => {
      console.info('ContentTypeTest1_0070 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest1_0070] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.UNSPECIFIED');
      console.info('[ContentTypeTest1_0070] END');
      done();
    });
  })
}

