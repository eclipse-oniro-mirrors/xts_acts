'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON,MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MovingPhotoViewTest() {
  describe('MovingPhotoViewTest', () => {
    beforeAll(() => {
      console.info("MovingPhotoViewTest beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("MovingPhotoViewTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoView',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MovingPhotoViewTest state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoView" == pages.name)) {
          console.info("get MovingPhotoViewTest state pages.name: " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MovingPhotoViewTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MovingPhotoViewTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0010
     * @tc.name     MovingPhotoViewTest_static_0010
     * @tc.desc     MovingPhotoViewTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0010 onComplete,setAutoPlayPeriod');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_setAutoPlayPeriod'));
      await CommonFunc.sleep(500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_complete');
        let strJson1 = inspector.getInspectorByKey('MovingPhotoView_autoPlayPeriodStart');
        let strJson2 = inspector.getInspectorByKey('MovingPhotoView_autoPlayPeriodEnd');
        console.log('MovingPhotoViewTest_0010', JSON.parseJsonElement(strJson).getElement('$attrs'))
        console.log('MovingPhotoViewTest_0010-1', JSON.parseJsonElement(strJson1).getElement('$attrs'))
        console.log('MovingPhotoViewTest_0010-2', JSON.parseJsonElement(strJson2).getElement('$attrs'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onComplete succ");
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual("100");
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("500");

      console.info('MovingPhotoViewTest_0010 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0020
     * @tc.name     MovingPhotoViewTest_static_0020
     * @tc.desc     MovingPhotoViewTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0020 onStart,onPause,onFinish,autoPlay');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_autoPlay'));
      await CommonFunc.sleep(500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_start');
        let strJson1 = inspector.getInspectorByKey('MovingPhotoView_pause');
        let strJson2 = inspector.getInspectorByKey('MovingPhotoView_finish');
        let strJson3 = inspector.getInspectorByKey('MovingPhotoView_autoPlay1');
        console.log('MovingPhotoViewTest_0020', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        console.log('MovingPhotoViewTest_0020-1', JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        console.log('MovingPhotoViewTest_0020-2', JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        console.log('MovingPhotoViewTest_0020-3', JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onStart succ");
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual("onPause succ");
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual("onFinish succ");
        expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual("true");

      console.info('MovingPhotoViewTest_0020 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0030
     * @tc.name     MovingPhotoViewTest_static_0030
     * @tc.desc     MovingPhotoViewTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0030 startPlayback');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await CommonFunc.sleep(500);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_play');
        console.log('MovingPhotoViewTest_0030', JSON.parseJsonElement(strJson).getElement('$attrs'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("startPlayback succ");

      console.info('MovingPhotoViewTest_0030 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0040
     * @tc.name     MovingPhotoViewTest_static_0040
     * @tc.desc     MovingPhotoViewTest_static_0040
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0040 stopPlayback');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopPlay'));
      await CommonFunc.sleep(500);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_stopPlay1');
        console.log('MovingPhotoViewTest_0040', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("stopPlayback succ");

      console.info('MovingPhotoViewTest_0040 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0050
     * @tc.name     MovingPhotoViewTest_static_0050
     * @tc.desc     MovingPhotoViewTest_static_0050
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0050 onStop');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopButton'));
      await CommonFunc.sleep(500);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_stop');
        console.log('MovingPhotoViewTest_0050', JSON.parseJsonElement(strJson).getElement('$attrs'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onStop succ");

      console.info('MovingPhotoViewTest_0050 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0060
     * @tc.name     MovingPhotoViewTest_static_0060
     * @tc.desc     MovingPhotoViewTest_static_0060
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0060 muted');


        let strJson = inspector.getInspectorByKey('MovingPhotoView_mute');
        console.log('MovingPhotoViewTest_0060', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("false");

      console.info('MovingPhotoViewTest_0060 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0070
     * @tc.name     MovingPhotoViewTest_static_0070
     * @tc.desc     MovingPhotoViewTest_static_0070
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0070 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_true'));
      await CommonFunc.sleep(500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_mute');

        console.log('MovingPhotoViewTest_0070', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("true");

      console.info('MovingPhotoViewTest_0070 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0080
     * @tc.name     MovingPhotoViewTest_static_0080
     * @tc.desc     MovingPhotoViewTest_static_0080
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0080 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_errorButton'));
      await CommonFunc.sleep(500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_error');
        console.log('MovingPhotoViewTest_0080', JSON.parseJsonElement(strJson).getElement('$attrs'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onError succ");

      console.info('MovingPhotoViewTest_0080 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0090
     * @tc.name     MovingPhotoViewTest_static_0090
     * @tc.desc     MovingPhotoViewTest_static_0090
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await CommonFunc.sleep(500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_complete');
        console.log('MovingPhotoViewTest_0090', JSON.parseJsonElement(strJson).getElement('$attrs'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onComplete succ");

      console.info('MovingPhotoViewTest_0090 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0100
     * @tc.name     MovingPhotoViewTest_static_0100
     * @tc.desc     MovingPhotoViewTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0100 START');


        let strJson = inspector.getInspectorByKey('MovingPhotoView_repeatPlay');
        console.log('MovingPhotoViewTest_0100', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("false");

      console.info('MovingPhotoViewTest_0100 END');
      done();
    });

    
    /**
     * @tc.number   MovingPhotoViewTest_static_0110
     * @tc.name     MovingPhotoViewTest_static_0110
     * @tc.desc     MovingPhotoViewTest_static_0110
     * @tc.level    Level.LEVEL2
     */
it('MovingPhotoViewTest_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MovingPhotoViewTest_0110 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('MovingPhotoView_repeatPlay_true'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);


        let strJson = inspector.getInspectorByKey('MovingPhotoView_repeatPlay');
        console.log('MovingPhotoViewTest_0110', JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("true");

      console.info('MovingPhotoViewTest_0110 END');
      done();
    });
  })
}
