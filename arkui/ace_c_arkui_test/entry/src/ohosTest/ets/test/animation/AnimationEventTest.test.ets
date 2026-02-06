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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function animationEventTest(){

  describe('AnimationEventTest', () => {

    afterEach(async (done: Function) => {
      // await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   testAnimateOption001
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0100
     * @tc.desc   testing animateTo with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimateToTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 500)
      });
      await Utils.clickComponent('Button1')
      await Utils.sleep(1000)
      expect(parseFloat((JSON.parse(getInspectorByKey('Animation1')).$attrs.width).split('vp')[0])).assertEqual(100)
      expect(Utils.getComponentInfoByKey('Animation1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testKeyframeAnimateOption012
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1200
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption012', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'KeyframeRegisterOnFinishTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Button2')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('Animation2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testKeyframeAnimateOption023
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2300
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption023', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'KeyframeRegisterOnEventTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Button3')
      await Utils.sleep(1000)
      expect(JSON.parse(getInspectorByKey('Animation3')).$attrs.width).assertEqual('100.00vp')
      done();
    });

    /**
     * @tc.name   testAnimatorOption047
     * @tc.number SUB_ARKUI_CAPI_ANIMATOROPTION_4700
     * @tc.desc   testing OH_ArkUI_AnimatorOption_RegisterOnFrameCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimatorOption047', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimatorRegisterOnFrameTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1500)
      });
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Pause')
      await Utils.sleep(500)
      expect(Utils.getComponentInfoByKey('Animation4').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    });

    /**
     * @tc.name   testAnimatorOption050
     * @tc.number SUB_ARKUI_CAPI_ANIMATOROPTION_5000
     * @tc.desc   testing OH_ArkUI_AnimatorOption_RegisterOnFinishCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimatorOption050', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimatorRegisterOnFinishTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Finish')
      await Utils.sleep(500)
      expect(Utils.getComponentInfoByKey('Animation5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testAnimatorOption053
     * @tc.number SUB_ARKUI_CAPI_ANIMATOROPTION_5300
     * @tc.desc   testing OH_ArkUI_AnimatorOption_RegisterOnCancelCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimatorOption053', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimatorRegisterOnCancelTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Cancel')
      await Utils.sleep(500)
      expect(Utils.getComponentInfoByKey('Animation6').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    });

    /**
     * @tc.name   testAnimatorOption056
     * @tc.number SUB_ARKUI_CAPI_ANIMATOROPTION_5600
     * @tc.desc   testing OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimatorOption056', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimatorRegisterOnRepeatTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Play')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('Animation7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /**
     * @tc.name   testAnimatorOption062
     * @tc.number SUB_ARKUI_CAPI_ANIMATOROPTION_6200
     * @tc.desc   testing OH_ArkUI_Animator_Reverse with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimatorOption062', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AnimatorReverseTest';
      await Utils.pushPage(`animation/${PAGE_TAG}`, ()=>{
        setTimeout(()=>{}, 1000)
      });
      await Utils.clickComponent('Reverse')
      await Utils.clickComponent('Pause')
      expect(parseFloat((JSON.parse(getInspectorByKey('Animation8')).$attrs.width).split('vp')[0]) > 150.0)
        .assertEqual(true)
      done();
    });

  })
}