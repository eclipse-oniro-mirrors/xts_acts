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


export default function RichEditorOnDoubleClickTest() {
  describe('RichEditorOnDoubleClickTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnDoubleClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi14/onDoubleClickOnHover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnDoubleClickTest state pages: " + JSON.stringify(pages));
        if (!("onDoubleClickOnHover" == pages.name)) {
          console.info("get RichEditorOnDoubleClickTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorOnDoubleClickTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnDoubleClickTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorOnDoubleClickTest_0010
     * @tc.number RichEditorOnDoubleClickTest_0010
     * @tc.desc   test RichEditorImageSpanOptions onHover: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RichEditorOnDoubleClickTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorOnDoubleClickTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_OnDoubleClickOnHover'));
      let point = await RichEditor.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x: point.x , y: point.y })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('OnDoubleClickOnHover');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorOnDoubleClickTest_0010] content: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onHover:true');
      console.info('[RichEditorOnDoubleClickTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorOnDoubleClickTest_0020
     * @tc.number RichEditorOnDoubleClickTest_0020
     * @tc.desc   test RichEditorImageSpanOptions onHover: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RichEditorOnDoubleClickTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorOnDoubleClickTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let RichEditor = await driver.findComponent(ON.id('RichEditor_OnDoubleClickOnHover'));
      let point = await RichEditor.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x:point.x , y:point.y })
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('OnDoubleClickOnHover'));
      let point2 = await text.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({ x:point2.x , y:point2.y })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('OnDoubleClickOnHover');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorOnDoubleClickTest_0020] content: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onHover:false');
      console.info('[RichEditorOnDoubleClickTest_0020] END');
      done();
    });
  })
}
