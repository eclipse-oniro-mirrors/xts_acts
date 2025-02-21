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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function OffScreenCanvasTest() {

  const SUITE: string = 'OffScreenCanvas'
  describe('OffScreenCanvasTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/OffScreenCanvas/OffScreenCanvas"
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("OffScreenCanvas" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: Record<string, Object>) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Canvas_API_OffScreenCanvas_0100
     *tc.name   OffScreenCanvas support transferToImageBitmap and getContext
     *tc.desc   OffScreenCanvas support transferToImageBitmap and getContext
     */
    it('ArkUI_Canvas_API_OffScreenCanvas_0100', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Canvas_API_OffScreenCanvas_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson: string = getInspectorByKey('OffScreenCanvas_Canvas1')
      expect(JSON.parse(strJson).$type).assertEqual('Canvas')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });
  })
}
