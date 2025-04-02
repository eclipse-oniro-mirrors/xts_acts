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
     * @tc.desc test the api of MovingPhotoView: onStart
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0010', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_start');
      console.log('MovingPhotoViewTest_0010', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStart succ");
      console.info('MovingPhotoViewTest_0010 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0020
     * @tc.name MovingPhotoViewTest_0020
     * @tc.desc test the api of MovingPhotoView: startPlayback
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0020', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_play');
      console.log('MovingPhotoViewTest_0020', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("startPlayback succ");
      console.info('MovingPhotoViewTest_0020 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0030
     * @tc.name MovingPhotoViewTest_0030
     * @tc.desc test the api of MovingPhotoView: stopPlayback
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0030', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_stopPaly');
      console.log('MovingPhotoViewTest_0030', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("stopPlayback succ");
      console.info('MovingPhotoViewTest_0030 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0040
     * @tc.name MovingPhotoViewTest_0040
     * @tc.desc test the api of MovingPhotoView: onStop
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0040', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView_stopButton'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_stop');
      console.log('MovingPhotoViewTest_0040', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onStop succ");
      console.info('MovingPhotoViewTest_0040 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0050
     * @tc.name MovingPhotoViewTest_0050
     * @tc.desc test the api of MovingPhotoView: muted
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0050', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0050 START');
      let strJson = getInspectorByKey('MovingPhotoView');
      console.log('MovingPhotoViewTest_0050', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.muted).assertEqual("false");
      console.info('MovingPhotoViewTest_0050 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0060
     * @tc.name MovingPhotoViewTest_0060
     * @tc.desc test the api of MovingPhotoView: objectFit
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0060', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0060 START');
      let strJson = getInspectorByKey('MovingPhotoView');
      console.log('MovingPhotoViewTest_0060', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.objectFit).assertEqual("ImageFit.Contain");
      console.info('MovingPhotoViewTest_0060 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0070
     * @tc.name MovingPhotoViewTest_0070
     * @tc.desc test the api of MovingPhotoView: onPause
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0070', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0070 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('MovingPhotoView'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_pause');
      console.log('MovingPhotoViewTest_0070', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onPause succ");
      console.info('MovingPhotoViewTest_0070 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0080
     * @tc.name MovingPhotoViewTest_0080
     * @tc.desc test the api of MovingPhotoView: onFinish
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0080', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0080 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(13000);
      let strJson = getInspectorByKey('MovingPhotoView_finish');
      console.log('MovingPhotoViewTest_0080', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onFinish succ");
      console.info('MovingPhotoViewTest_0080 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0090
     * @tc.name MovingPhotoViewTest_0090
     * @tc.desc test the api of MovingPhotoView: onError
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0090', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0090 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_playButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView_error');
      console.log('MovingPhotoViewTest_0090', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("onError succ");
      console.info('MovingPhotoViewTest_0090 END');
      done();
    });

    /**
     * @tc.number MovingPhotoViewTest_0100
     * @tc.name MovingPhotoViewTest_0100
     * @tc.desc test the api of MovingPhotoView: muted
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('MovingPhotoViewTest_0100', 0, async (done: Function) => {
      console.info('MovingPhotoViewTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('MovingPhotoView_true'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoView');
      console.log('MovingPhotoViewTest_0100', JSON.parse(strJson).$attrs)
      expect(JSON.parse(strJson).$attrs.muted).assertEqual(true);
      console.info('MovingPhotoViewTest_0100 END');
      done();
    });
  })
}
