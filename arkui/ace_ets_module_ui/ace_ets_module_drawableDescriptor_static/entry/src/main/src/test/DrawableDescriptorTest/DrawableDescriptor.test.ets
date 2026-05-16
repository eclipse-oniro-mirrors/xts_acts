'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { AnimationStopMode, AnimationOptions } from '@ohos.arkui.drawableDescriptor';

const SLEEP_TIME = 1000;

export default function DrawableDescriptorTest() {
  describe('DrawableDescriptorTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.drawableDescriptor.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/DrawableDescriptor/DrawableDescriptorIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] DrawableDescriptorTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "DrawableDescriptorIndex") { routerInstance.replaceUrl(options); }
        await Utils.sleep(500);
      } catch (err) { console.error('[ARKUI_NEW] DrawableDescriptorTest replaceUrl error: ' + err); expect().assertFail(); }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] DrawableDescriptorTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0100
     * @tc.name animationStopModeFirstFrame
     * @tc.desc Test AnimationStopMode.FIRST_FRAME enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationStopModeFirstFrame', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animationStopModeFirstFrame START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(AnimationStopMode.FIRST_FRAME).assertEqual(0);
        done();
      } catch (error) { console.error('[ARKUI_NEW] animationStopModeFirstFrame error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0200
     * @tc.name animationStopModeLastFrame
     * @tc.desc Test AnimationStopMode.LAST_FRAME enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationStopModeLastFrame', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animationStopModeLastFrame START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(AnimationStopMode.LAST_FRAME).assertEqual(1);
        done();
      } catch (error) { console.error('[ARKUI_NEW] animationStopModeLastFrame error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0300
     * @tc.name animationOptionsStopModeDefault
     * @tc.desc Test AnimationOptions stopMode field defaults to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationOptionsStopModeDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animationOptionsStopModeDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: AnimationOptions = {};
        expect(opts.stopMode).assertEqual(undefined);
        done();
      } catch (error) { console.error('[ARKUI_NEW] animationOptionsStopModeDefault error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0400
     * @tc.name animationOptionsStopModeFirstFrame
     * @tc.desc Test AnimationOptions with stopMode FIRST_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationOptionsStopModeFirstFrame', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animationOptionsStopModeFirstFrame START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: AnimationOptions = { stopMode: AnimationStopMode.FIRST_FRAME };
        expect(opts.stopMode).assertEqual(AnimationStopMode.FIRST_FRAME);
        expect(opts.stopMode).assertEqual(0);
        done();
      } catch (error) { console.error('[ARKUI_NEW] animationOptionsStopModeFirstFrame error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0500
     * @tc.name animationOptionsStopModeLastFrame
     * @tc.desc Test AnimationOptions with stopMode LAST_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animationOptionsStopModeLastFrame', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animationOptionsStopModeLastFrame START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: AnimationOptions = { stopMode: AnimationStopMode.LAST_FRAME };
        expect(opts.stopMode).assertEqual(AnimationStopMode.LAST_FRAME);
        expect(opts.stopMode).assertEqual(1);
        done();
      } catch (error) { console.error('[ARKUI_NEW] animationOptionsStopModeLastFrame error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0600
     * @tc.name drawableDescriptorImageRendered
     * @tc.desc Verify Image component renders in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('drawableDescriptorImageRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: drawableDescriptorImageRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('ddImage1');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] drawableDescriptorImageRendered error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DRAWABLEDESCRIPTOR_0700
     * @tc.name animStopModeFromPage
     * @tc.desc Verify AnimationStopMode values stored by page in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('animStopModeFromPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DrawableDescriptorTest execute: animStopModeFromPage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let first = AppStorage.get<string>('animStopModeFirst');
        let last = AppStorage.get<string>('animStopModeLast');
        console.info('[ARKUI_NEW] animStopModeFirst=' + first + ', animStopModeLast=' + last);
        expect(first != null && first != undefined).assertTrue();
        expect(last != null && last != undefined).assertTrue();
        expect(first).assertEqual('0');
        expect(last).assertEqual('1');
        done();
      } catch (error) { console.error('[ARKUI_NEW] animStopModeFromPage error:' + error); expect().assertFail(); done(); }
    });
  });
}
