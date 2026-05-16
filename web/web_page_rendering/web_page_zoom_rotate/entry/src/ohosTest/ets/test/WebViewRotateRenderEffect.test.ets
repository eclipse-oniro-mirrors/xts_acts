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
import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 183002;
const driver = Driver.create();

export default function WebViewRotateRenderEffect() {

  describe('WebViewRotateRenderEffectTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewRotateRenderEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewRotateRenderEffect state success " + JSON.stringify(pages));
        if (!("WebViewRotateRenderEffect" == pages.name)) {
          console.info("get WebViewRotateRenderEffect state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewRotateRenderEffect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewRotateRenderEffect page error: " + err);
      }
      await driver.waitForComponent(ON.id("rotateRenderEffectButton"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewRotateRenderEffect afterEach start");
      console.info("WebViewRotateRenderEffect afterEach end");
      done();
    })

    /**
     * @tc.name   testRotateRenderEffect01
     * @tc.number SUB_WEB_ROTATERENDEREFFECT_0100
     * @tc.desc   test rotateRenderEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateRenderEffect01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRotateRenderEffect01", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testRotateRenderEffect01", WebRotateEffect.RESIZE_COVER_EFFECT,
        20251101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'rotateRenderEffectButton', 'testRotateRenderEffect01');
    })

    /**
     * @tc.name   testRotateRenderEffect02
     * @tc.number SUB_WEB_ROTATERENDEREFFECT_0200
     * @tc.desc   test rotateRenderEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateRenderEffect02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRotateRenderEffect02", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testRotateRenderEffect02", WebRotateEffect.TOPLEFT_EFFECT,
        20251102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'rotateRenderEffectButton', 'testRotateRenderEffect02');
    })


  })
}
