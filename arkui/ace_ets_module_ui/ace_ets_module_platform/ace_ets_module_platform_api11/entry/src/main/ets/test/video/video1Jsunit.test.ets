/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function VideoJsunit01() {
  describe('VideoJsunit01', () => {
    beforeEach(async (done: Function) => {
      console.info("VideoJsunit01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/video1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VideoJsunit01 state pages: " + JSON.stringify(pages));
        if (!("video1" == pages.name)) {
          console.info("get VideoJsunit01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoJsunit01 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoJsunit01 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46Q4_
    * @tc.name  : VideoJsunit01_0100
    * @tc.desc  : 测试onPrepared方法
    * @tc.level : Level 3
    */
    it('VideoJsunit01_0100', 0, async (done: Function) => {
      console.info('[VideoJsunit01_0100] START');
      let driver = await UiDriver.create()
      let srcbutton = await driver.findComponent(BY.key('srcbutton'));
      await srcbutton.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onPrepared');
      console.info("[VideoJsunit01_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onPrepared_Doing');
      await CommonFunc.sleep(1000);
      console.info('[VideoJsunit01_0100] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000I46Q4_071；SUB_ACE_TS_COMPONENT_SR000I46Q4_072；SUB_ACE_TS_COMPONENT_SR000I46Q4_073；
    * @tc.name  : VideoJsunit01_0200
    * @tc.desc  : 测试onStart-onPause-onFinish-onUpdate方法
    * @tc.level : Level 3
    */
    it('VideoJsunit01_0200', 0, async (done: Function) => {
      //      点击start按钮，测试onStart是否触发，测试onUpdate方法
      console.info('[VideoJsunit01_0200] START');
      let driver = await UiDriver.create()
      let srcbutton = await driver.findComponent(BY.key('start'));
      await srcbutton.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onStart');
      let obj = JSON.parse(strJson);
      console.info("[VideoJsunit01_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onStart_Doing');
      await CommonFunc.sleep(1000);

      let str4 = getInspectorByKey('onUpdate');
      let obj14 = JSON.parse(str4);
      console.info("[VideoJsunit01_0200] component obj14 is: " + JSON.stringify(obj14));
      expect(obj14.$attrs.content).assertEqual('onUpdate_Doing');
      await CommonFunc.sleep(1000);

      //      继续点击暂停Pause按钮，测试onPause是否触发
      let pausebutton = await driver.findComponent(BY.key('pause'));
      await pausebutton.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('onPause');
      let obj1 = JSON.parse(strJson1);
      console.info("[VideoJsunit01_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onPause_Doing');
      await CommonFunc.sleep(1000);
      //      再次点击start按钮，让它播放完【视频总长10秒，间隔13秒左右】，测试onFinish方法
      let srcbutton2 = await driver.findComponent(BY.key('start'));
      await srcbutton2.click();
      await CommonFunc.sleep(13000);

      let strJson2 = getInspectorByKey('onFinish');
      let obj2 = JSON.parse(strJson2);
      console.info("[VideoJsunit01_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('onFinish_Doing');
      await CommonFunc.sleep(1000);

      console.info('[VideoJsunit01_0200] END');
      done();
    });

  })
}
