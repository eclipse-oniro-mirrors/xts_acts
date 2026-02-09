'use static';
/*
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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';


export default function VideoJsunit01() {
  describe('VideoJsunit01', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("VideoJsunit01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/video1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get VideoJsunit01 state pages: " + JSON.stringify(pages));
        if (!("video1" == pages.name)) {
          console.info("get VideoJsunit01 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoJsunit01 page error: " + err);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.number   VideoJsunit01_static_0100
     * @tc.name     VideoJsunit01_static_0100
     * @tc.desc     VideoJsunit01_static_0100
     * @tc.level    Level.LEVEL3
     */
it('VideoJsunit01_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[VideoJsunit01_0100] START');
      let driver = Driver.create()
      let srcbutton = await (driver.findComponent(ON.id('srcbutton')) as Promise<Component>);
      await srcbutton.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('onPrepared');
      console.info("[VideoJsunit01_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onPrepared_Doing');
      await CommonFunc.sleep(1000);
      console.info('[VideoJsunit01_0100] END');
      done();
    });

    
    /**
     * @tc.number   VideoJsunit01_static__0200
     * @tc.name     VideoJsunit01_static__0200
     * @tc.desc     VideoJsunit01_static__0200
     * @tc.level    Level.LEVEL3
     */
it('VideoJsunit01_static__0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      //      点击start按钮，测试onStart是否触发，测试onUpdate方法
      console.info('[VideoJsunit01_0200] START');
      let driver = Driver.create()
      let srcbutton = await (driver.findComponent(ON.id('start')) as Promise<Component>);
      await srcbutton.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('onStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[VideoJsunit01_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onStart_Doing');
      await CommonFunc.sleep(1000);

      let str4 = inspector.getInspectorByKey('onUpdate');
      let obj14 = JSON.parseJsonElement(str4);
      console.info("[VideoJsunit01_0200] component obj14 is: " + JSON.stringify(obj14));
      expect(obj14.getElement('$attrs').getString('content')).assertEqual('onUpdate_Doing');
      await CommonFunc.sleep(1000);

      //      继续点击暂停Pause按钮，测试onPause是否触发
      let pausebutton = await (driver.findComponent(ON.id('pause')) as Promise<Component>);
      await pausebutton.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('onPause');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[VideoJsunit01_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onPause_Doing');
      await CommonFunc.sleep(1000);
      //      再次点击start按钮，让它播放完【视频总长10秒，间隔13秒左右】，测试onFinish方法
      let srcbutton2 = await (driver.findComponent(ON.id('start')) as Promise<Component>);
      await srcbutton2.click();
      await CommonFunc.sleep(13000);

      let strJson2 = inspector.getInspectorByKey('onFinish');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[VideoJsunit01_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onFinish_Doing');
      await CommonFunc.sleep(1000);

      console.info('[VideoJsunit01_0200] END');
      done();
    });

  })
}
