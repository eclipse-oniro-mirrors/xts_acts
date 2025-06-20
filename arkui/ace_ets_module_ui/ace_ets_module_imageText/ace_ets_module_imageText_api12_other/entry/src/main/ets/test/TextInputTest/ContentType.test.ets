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


export default function ContentTypeTest() {
  describe('ContentTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ContentTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/ContentType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContentTypeTest state pages: " + JSON.stringify(pages));
        if (!("ContentType" == pages.name)) {
          console.info("get ContentTypeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContentTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContentTypeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest_0010
     * @tc.name      ContentTypeTest_0010
     * @tc.desc      set textInput ContentType: USER_NAME
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_USER_NAME');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest_0010] contentType is: " + JSON.stringify(obj.$attrs.contentType));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.USER_NAME');
      console.info('[ContentTypeTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest_0020
     * @tc.name      ContentTypeTest_0020
     * @tc.desc      set textInput ContentType: NEW_PASSWORD
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('ContentTypeTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ContentType_NEW_PASSWORD');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ContentTypeTest_0020] contentType is: " + JSON.stringify(obj.$attrs.contentType));
      expect(obj.$attrs.contentType).assertEqual('TextContentType.NEW_PASSWORD');
      console.info('[ContentTypeTest_0020] END');
      done();
    });
  })
}