/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function NodeAdoptErrorCodeTest() {
  describe('NodeAdoptErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('NodeAdoptErrorCodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/NodeAdoptErrorCodeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get NodeAdoptErrorCodeTest state pages:' + JSON.stringify(pages));
        if (!('gestureEventTest' == pages.name)) {
          console.info('get NodeAdoptErrorCodeTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push NodeAdoptErrorCodeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NodeAdoptErrorCodeTest page error:' + err);
      }
      console.info('NodeAdoptErrorCodeTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('NodeAdoptErrorCodeTest after each called');
    });

    /**
     * @tc.name   NodeAdoptErrorCodeTest_0100
     * @tc.number NodeAdoptErrorCodeTest_0100
     * @tc.desc   adopt errorCode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptErrorCodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('NodeAdoptErrorCodeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_startTestOldApis'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('AddFrameNode100025：' + AppStorage.get('AddFrameNode100025'));
      console.info('FrameNodeInsertChildAfter100025：' + AppStorage.get('FrameNodeInsertChildAfter100025'));
      console.info('FrameNodeAppendChild100025：' + AppStorage.get('FrameNodeAppendChild100025'));
      console.info('MoveTo100027：' + AppStorage.get('MoveTo100027'));
      console.info('RenderNodeAppendChild100025：' + AppStorage.get('RenderNodeAppendChild100025'));
      console.info('RenderNodeInsertChildAfter100025：' + AppStorage.get('RenderNodeInsertChildAfter100025'));
      
      expect(AppStorage.get('AddFrameNode100025')).assertEqual(100025);
      expect(AppStorage.get('FrameNodeInsertChildAfter100025')).assertEqual(100025);
      expect(AppStorage.get('FrameNodeAppendChild100025')).assertEqual(100025);
      expect(AppStorage.get('MoveTo100027')).assertEqual(100027);
      expect(AppStorage.get('RenderNodeAppendChild100025')).assertEqual(100025);
      expect(AppStorage.get('RenderNodeInsertChildAfter100025')).assertEqual(100025);
      AppStorage.delete('AddFrameNode100025');
      AppStorage.delete('FrameNodeInsertChildAfter100025');
      AppStorage.delete('FrameNodeAppendChild100025');
      AppStorage.delete('MoveTo100027');
      AppStorage.delete('RenderNodeAppendChild100025');
      AppStorage.delete('RenderNodeInsertChildAfter100025');
      console.info('[NodeAdoptErrorCodeTest_0100] END');
      done();
    });

  })
}