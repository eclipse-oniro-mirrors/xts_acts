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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
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


export default function MovingPhotoViewApi13Test() {
  describe('MovingPhotoViewApi13Test', () => {
    beforeEach(async (done: Function) => {
      console.info("MovingPhotoViewApi13Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoViewApi13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MovingPhotoViewApi13Test state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoViewApi13" == pages.name)) {
          console.info("get MovingPhotoViewApi13Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MovingPhotoViewApi13Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MovingPhotoViewApi13Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0010
     * @tc.number MovingPhotoViewApi13Test_0010
     * @tc.desc   test the api of MovingPhotoViewApi13: onComplete, setAutoPlayPeriod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0010', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0010 onComplete,setAutoPlayPeriod');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoViewApi13_setAutoPlayPeriod'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_complete');
      let strJson1 = getInspectorByKey('MovingPhotoViewApi13_autoPlayPeriodStart');
      let strJson2 = getInspectorByKey('MovingPhotoViewApi13_autoPlayPeriodEnd');
      console.log('MovingPhotoViewApi13Test_0010', JSON.parse(strJson).$attrs)
      console.log('MovingPhotoViewApi13Test_0010-1', JSON.parse(strJson1).$attrs)
      console.log('MovingPhotoViewApi13Test_0010-2', JSON.parse(strJson2).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onComplete succ");
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("100");
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("500");
      console.info('MovingPhotoViewApi13Test_0010 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0020
     * @tc.number MovingPhotoViewApi13Test_0020
     * @tc.desc   test the api of MovingPhotoViewApi13: onStart,onPause,onFinish,autoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0020', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0020 onStart,onPause,onFinish,autoPlay');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoViewApi13_autoPlay'));
      await button1.click();
      await CommonFunc.sleep(10000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_start');
      let strJson1 = getInspectorByKey('MovingPhotoViewApi13_pause');
      let strJson2 = getInspectorByKey('MovingPhotoViewApi13_finish');
      let strJson3 = getInspectorByKey('MovingPhotoViewApi13_autoPlay1');
      console.log('MovingPhotoViewApi13Test_0020', JSON.parse(strJson).$attrs.content)
      console.log('MovingPhotoViewApi13Test_0020-1', JSON.parse(strJson1).$attrs.content)
      console.log('MovingPhotoViewApi13Test_0020-2', JSON.parse(strJson2).$attrs.content)
      console.log('MovingPhotoViewApi13Test_0020-3', JSON.parse(strJson3).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStart succ");
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("onPause succ");
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("onFinish succ");
      expect(JSON.parse(strJson3).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewApi13Test_0020 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0030
     * @tc.number MovingPhotoViewApi13Test_0030
     * @tc.desc   test the api of MovingPhotoViewApi13: startPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0030', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0030 startPlayback');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('MovingPhotoViewApi13_playButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_play');
      console.log('MovingPhotoViewApi13Test_0030', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("startPlayback succ");
      console.info('MovingPhotoViewApi13Test_0030 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0040
     * @tc.number MovingPhotoViewApi13Test_0040
     * @tc.desc   test the api of MovingPhotoViewApi13: stopPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0040', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0040 stopPlayback');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('MovingPhotoViewApi13_stopPlay'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_stopPlay1');
      console.log('MovingPhotoViewApi13Test_0040', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("stopPlayback succ");
      console.info('MovingPhotoViewApi13Test_0040 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0050
     * @tc.number MovingPhotoViewApi13Test_0050
     * @tc.desc   test the api of MovingPhotoViewApi13: onStop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0050', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0050 onStop');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoViewApi13_stopButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_stop');
      console.log('MovingPhotoViewApi13Test_0050', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStop succ");
      console.info('MovingPhotoViewApi13Test_0050 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0060
     * @tc.number MovingPhotoViewApi13Test_0060
     * @tc.desc   test the api of MovingPhotoViewApi13: muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0060', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0060 muted');
      let strJson = getInspectorByKey('MovingPhotoViewApi13_mute');
      console.log('MovingPhotoViewApi13Test_0060', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("false");
      console.info('MovingPhotoViewApi13Test_0060 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0070
     * @tc.number MovingPhotoViewApi13Test_0070
     * @tc.desc   test the api of MovingPhotoViewApi13: muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0070', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0070 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('MovingPhotoViewApi13_true'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_mute');
      console.log('MovingPhotoViewApi13Test_0070', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewApi13Test_0070 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0080
     * @tc.number MovingPhotoViewApi13Test_0080
     * @tc.desc   test the api of MovingPhotoViewApi13: onError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0080', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0080 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoViewApi13_errorButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_error');
      console.log('MovingPhotoViewApi13Test_0080', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onError succ");
      console.info('MovingPhotoViewApi13Test_0080 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0090
     * @tc.number MovingPhotoViewApi13Test_0090
     * @tc.desc   test the api of MovingPhotoViewApi13: muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0090', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoViewApi13_playButton'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_complete');
      console.log('MovingPhotoViewApi13Test_0090', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onComplete succ");
      console.info('MovingPhotoViewApi13Test_0090 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0100
     * @tc.number MovingPhotoViewApi13Test_0100
     * @tc.desc   test the api of MovingPhotoViewApi13: repeatPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0100 START');
      let strJson = getInspectorByKey('MovingPhotoViewApi13_repeatPlay');
      console.log('MovingPhotoViewApi13Test_0100', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("false");
      console.info('MovingPhotoViewApi13Test_0100 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi13Test_0110
     * @tc.number MovingPhotoViewApi13Test_0110
     * @tc.desc   test the api of MovingPhotoViewApi13: repeatPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi13Test_0110', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi13Test_0110 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('MovingPhotoViewApi13_repeatPlay_true'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi13_repeatPlay');
      console.log('MovingPhotoViewApi13Test_0110', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewApi13Test_0110 END');
      done();
    });
  })
}
