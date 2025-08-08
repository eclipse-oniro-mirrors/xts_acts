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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function EnablePreviewMenuTest() {
  describe('EnablePreviewMenuTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EnablePreviewMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/EnablePreviewMenu',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnablePreviewMenuTest state pages: " + JSON.stringify(pages));
        if (!("EnablePreviewMenu" == pages.name)) {
          console.info("get EnablePreviewMenuTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EnablePreviewMenuTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnablePreviewMenuTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0010
     * @tc.name      EnablePreviewMenuTest_0010
     * @tc.desc      test the dataDetectorConfig of Text: enablePreviewMenu(false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0010] START');
      let strJson = getInspectorByKey('enablePreviewMenu_set');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0010] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"false');
      console.info('[EnablePreviewMenuTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0020
     * @tc.name      EnablePreviewMenuTest_0020
     * @tc.desc      test the dataDetectorConfig of Text: enablePreviewMenu(true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('enablePreviewMenu_true'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enablePreviewMenu_set');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0020] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"true');
      console.info('[EnablePreviewMenuTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0030
     * @tc.name      EnablePreviewMenuTest_0030
     * @tc.desc      test the dataDetectorConfig of Text: enablePreviewMenu(default)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0030] START');
      let strJson = getInspectorByKey('enablePreviewMenu_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0030] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"false');
      console.info('[EnablePreviewMenuTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0040
     * @tc.name      EnablePreviewMenuTest_0040
     * @tc.desc      test the dataDetectorConfig of Text: enablePreviewMenu(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('enablePreviewMenu_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enablePreviewMenu_set');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0040] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"false');
      console.info('[EnablePreviewMenuTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0050
     * @tc.name      EnablePreviewMenuTest_0050
     * @tc.desc      test the dataDetectorConfig of TextModifier: enablePreviewMenu(true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0050] START');
      let strJson = getInspectorByKey('Modifier_enablePreviewMenu_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0050] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"true');
      console.info('[EnablePreviewMenuTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0060
     * @tc.name      EnablePreviewMenuTest_0060
     * @tc.desc      test the dataDetectorConfig of TextModifier: enablePreviewMenu(false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0060] START');
      let strJson = getInspectorByKey('Modifier_enablePreviewMenu_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0060] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"false');
      console.info('[EnablePreviewMenuTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnablePreviewMenuTest_0070
     * @tc.name      EnablePreviewMenuTest_0070
     * @tc.desc      test the dataDetectorConfig of TextModifier: enablePreviewMenu(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('EnablePreviewMenuTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[EnablePreviewMenuTest_0070] START');
      let strJson = getInspectorByKey('Modifier_enablePreviewMenu_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnablePreviewMenuTest_0070] value: ' + JSON.stringify(obj.$attrs.dataDetectorConfig));
      expect(''+JSON.stringify(obj.$attrs.dataDetectorConfig)).assertContain('enablePreviewMenu\\":\\"false');
      console.info('[EnablePreviewMenuTest_0070] END');
      done();
    });
  })
}