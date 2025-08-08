/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function WaterFlowEffectEdge() {
  const SUITE: string = 'WaterFlowEffectEdge'
  const waitUiReadyMs: number = 1500

  describe('WaterFlowEffectEdge', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowEffectEdge",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("WaterFlowEffectEdge" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     * @tc.number :ArkUI_WaterFlow_EffectEdge_0500
     * @tc.name   :test effect edge callback
     * @tc.desc   :test whether edgeEffectiveness Options are effective
     */
    it('ArkUI_WaterFlow_EffectEdge_0500', Level.LEVEL1, async (done: Function) => {
      let json1 = getInspectorByKey('waterFlow4')
      await sleep(1000)
      let obj: ESObject = JSON.parse(json1);
      let value: string = obj.$attrs?.edgeEffectOptions?.effectEdge;
      console.log('ArkUI_WaterFlow_EffectEdge_0500 json1 ' + json1)
      console.log('ArkUI_WaterFlow_EffectEdge_0500 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.Start')
      done()
    });
  })
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
