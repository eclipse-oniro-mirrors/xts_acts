/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  UiDriver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function MovingPhotoViewTest() {
  describe('MovingPhotoViewTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MovingPhotoViewTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoView',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MovingPhotoViewTest state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoView" == pages.name)) {
          console.info("get MovingPhotoViewTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MovingPhotoViewTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MovingPhotoViewTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0010
     * @tc.name MovingPhotoViewTest_0010
     * @tc.desc test the api of MovingPhotoView: onComplete, setAutoPlayPeriod
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0010', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0010 onComplete,setAutoPlayPeriod');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_setAutoPlayPeriod'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_complete');
      let strJson1 = getInspectorByKey('MovingPhotoView_autoPlayPeriodStart');
      let strJson2 = getInspectorByKey('MovingPhotoView_autoPlayPeriodEnd');
      console.log('MovingPhotoViewTest_0010', JSON.parse(strJson).$attrs)
      console.log('MovingPhotoViewTest_0010-1', JSON.parse(strJson1).$attrs)
      console.log('MovingPhotoViewTest_0010-2', JSON.parse(strJson2).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onComplete succ");
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("100");
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("500");
      console.info('MovingPhotoViewTest_0010 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0020
     * @tc.name MovingPhotoViewTest_0020
     * @tc.desc test the api of MovingPhotoView: onStart,onPause,onFinish,autoPlay
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0020', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0020 onStart,onPause,onFinish,autoPlay');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_autoPlay'));
      await button1.click();
      await CommonFunc.sleep(5000);
      let strJson = getInspectorByKey('MovingPhotoView_start');
      let strJson1 = getInspectorByKey('MovingPhotoView_pause');
      let strJson2 = getInspectorByKey('MovingPhotoView_finish');
      let strJson3 = getInspectorByKey('MovingPhotoView_autoPlay1');
      console.log('MovingPhotoViewTest_0020', JSON.parse(strJson).$attrs.content)
      console.log('MovingPhotoViewTest_0020-1', JSON.parse(strJson1).$attrs.content)
      console.log('MovingPhotoViewTest_0020-2', JSON.parse(strJson2).$attrs.content)
      console.log('MovingPhotoViewTest_0020-3', JSON.parse(strJson3).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStart succ");
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("onPause succ");
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onFinish succ");
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewTest_0020 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0030
     * @tc.name MovingPhotoViewTest_0030
     * @tc.desc test the api of MovingPhotoView: startPlayback
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0030', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0030 startPlayback');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_play');
      console.log('MovingPhotoViewTest_0030', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("startPlayback succ");
      console.info('MovingPhotoViewTest_0030 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0040
     * @tc.name MovingPhotoViewTest_0040
     * @tc.desc test the api of MovingPhotoView: stopPlayback
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0040', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0040 stopPlayback');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopPlay'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_stopPlay1');
      console.log('MovingPhotoViewTest_0040', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("stopPlayback succ");
      console.info('MovingPhotoViewTest_0040 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0050
     * @tc.name MovingPhotoViewTest_0050
     * @tc.desc test the api of MovingPhotoView: onStop
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0050', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0050 onStop');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_stop');
      console.log('MovingPhotoViewTest_0050', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStop succ");
      console.info('MovingPhotoViewTest_0050 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0060
     * @tc.name MovingPhotoViewTest_0060
     * @tc.desc test the api of MovingPhotoView: muted
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0060', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0060 muted');
      let strJson = getInspectorByKey('MovingPhotoView_mute');
      console.log('MovingPhotoViewTest_0060', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("false");
      console.info('MovingPhotoViewTest_0060 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0070
     * @tc.name MovingPhotoViewTest_0070
     * @tc.desc test the api of MovingPhotoView: muted
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0070', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0070 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_true'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MovingPhotoView_mute');
      console.log('MovingPhotoViewTest_0070', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewTest_0070 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0080
     * @tc.name MovingPhotoViewTest_0080
     * @tc.desc test the api of MovingPhotoView: onError
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0080', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0080 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_errorButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_error');
      console.log('MovingPhotoViewTest_0080', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onError succ");
      console.info('MovingPhotoViewTest_0080 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0090
     * @tc.name MovingPhotoViewTest_0090
     * @tc.desc test the api of MovingPhotoView: muted
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0090', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('MovingPhotoView_complete');
      console.log('MovingPhotoViewTest_0090', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onComplete succ");
      console.info('MovingPhotoViewTest_0090 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0100
     * @tc.name MovingPhotoViewTest_0100
     * @tc.desc test the api of MovingPhotoView: repeatPlay
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0100', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0100 START');
      let strJson = getInspectorByKey('MovingPhotoView_repeatPlay');
      console.log('MovingPhotoViewTest_0100', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("false");
      console.info('MovingPhotoViewTest_0100 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0110
     * @tc.name MovingPhotoViewTest_0110
     * @tc.desc test the api of MovingPhotoView: repeatPlay
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0110', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0110 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('MovingPhotoView_repeatPlay_true'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_repeatPlay');
      console.log('MovingPhotoViewTest_0110', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewTest_0110 END');
      done();
    });
  })
}
