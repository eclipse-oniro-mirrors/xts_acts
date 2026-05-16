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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetFrameNodeMethodNullTest() {
  describe('GetRenderNodeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetFrameNodeMethodNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/GetFrameNodeMethodNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetFrameNodeMethodNullTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetFrameNodeMethodNullTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetFrameNodeMethodNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetFrameNodeMethodNullTest page error:" + err);
      }
      console.info("GetFrameNodeMethodNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetFrameNodeMethodNullTest after each called");
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0100
     * @tc.number GetFrameNodeMethodNullTest_0100
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_getMethodReturnNull'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getChildNullOne')).assertEqual(null);
      expect(AppStorage.get('getChildNullTwoExpand')).assertEqual(null);
      expect(AppStorage.get('getFirstChildNull')).assertEqual(null);
      expect(AppStorage.get('getNextSiblingNull')).assertEqual(null);
      expect(AppStorage.get('getPreviousSiblingNull')).assertEqual(null);
      expect(AppStorage.get('getParentNull')).assertEqual(null);
      AppStorage.delete('getChildNullOne')
      AppStorage.delete('getChildNullTwoExpand')
      AppStorage.delete('getFirstChildNull')
      AppStorage.delete('getNextSiblingNull')
      AppStorage.delete('getPreviousSiblingNull')
      AppStorage.delete('getParentNull')
      console.info('[GetFrameNodeMethodNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0200
     * @tc.number GetFrameNodeMethodNullTest_0200
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isVisibleBoolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isVisibleTrue')).assertEqual(true);
      expect(AppStorage.get('isVisibleFalse')).assertEqual(false);
      AppStorage.delete('isVisibleTrue')
      AppStorage.delete('isVisibleFalse')
      console.info('[GetFrameNodeMethodNullTest_0200] END');
      done();
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0300
     * @tc.number GetFrameNodeMethodNullTest_0300
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isClipToFrameBoolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isClipToFrameFalse')).assertEqual(false);
      expect(AppStorage.get('isClipToFrameTrue')).assertEqual(true);
      AppStorage.delete('isClipToFrameFalse')
      AppStorage.delete('isClipToFrameTrue')
      console.info('[GetFrameNodeMethodNullTest_0300] END');
      done();
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0400
     * @tc.number GetFrameNodeMethodNullTest_0400
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_isAttachedBoolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isAttachedTrue')).assertEqual(true);
      expect(AppStorage.get('isAttachedFalse')).assertEqual(false);
      AppStorage.delete('isAttachedTrue')
      AppStorage.delete('isAttachedFalse')
      console.info('[GetFrameNodeMethodNullTest_0400] END');
      done();
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0500
     * @tc.number GetFrameNodeMethodNullTest_0500
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_getCustomProperty'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('customPropertyUndefined')).assertEqual(undefined);
      AppStorage.delete('customPropertyUndefined')
      console.info('[GetFrameNodeMethodNullTest_0500] END');
      done();
    });

    /**
     * @tc.name   GetFrameNodeMethodNullTest_0600
     * @tc.number GetFrameNodeMethodNullTest_0600
     * @tc.desc   frameNode method null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeMethodNullTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('GetFrameNodeMethodNullTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_getRenderNodeNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getRenderNodeNull')).assertEqual(null);
      AppStorage.delete('getRenderNodeNull')
      console.info('[GetFrameNodeMethodNullTest_0600] END');
      done();
    });

  })
}