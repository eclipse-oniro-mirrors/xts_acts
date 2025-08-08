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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/utils/Common';
export default function APIParticleEmitter() {
  describe('APIParticleEmitter', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/APIParticleEmitter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIParticleEmitter state pages: " + JSON.stringify(pages));
        if (!("APIParticleEmitter" == pages.name)) {
          console.info("get APIParticleEmitter state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APIParticleEmitter success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIParticleEmitter page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIParticleEmitter after each called");
    });
    /**
     * @tc.number api
     * @tc.name APIParticleEmitter_0100
     * @tc.desc APIParticleEmitter_0100
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APIParticleEmitter_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIParticleEmitter_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('APIParticleEmitter_Button'));
      await create.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIParticleEmitter_Text01');
      console.info("[APIParticleEmitter_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0');
      console.info('[APIParticleEmitter_0100] END');
      done();
    });
  })
}