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
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function ScrollEffectEdge() {
  const SUITE: string = 'ScrollEffectEdge'
  const waitUiReadyMs: number = 1500

  describe('ScrollEffectEdge', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollEffectEdge",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ScrollEffectEdge" == pages.name)) {
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
     * @tc.number :ArkUI_Scroll_EffectEdge_0100
     * @tc.name   :test effect edge callback
     * @tc.desc   :test whether edgeEffectiveness Options are effective
     */
    it('ArkUI_Scroll_EffectEdge_0100', 0, async (done: Function) => {
      let json1 = getInspectorByKey('scroll1')
      await sleep(1000)
      let obj: ESObject = JSON.parse(json1);
      let value: string = obj.$attrs?.edgeEffectOptions?.effectEdge;
      console.log('ArkUI_Scroll_EffectEdge_0100 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_0100 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.Start')
      done()
    });

    /*
     * @tc.number :ArkUI_Scroll_EffectEdge_0200
     * @tc.name   :test effect edge callback
     * @tc.desc   :test whether edgeEffectiveness Options are effective
     */
    it('ArkUI_Scroll_EffectEdge_0200', 0, async (done: Function) => {
      let json1 = getInspectorByKey('scroll2')
      await sleep(1000)
      let obj: ESObject = JSON.parse(json1);
      let value: string = obj.$attrs?.edgeEffectOptions?.effectEdge;
      console.log('ArkUI_Scroll_EffectEdge_0200 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_0200 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.All')
      done()
    });

    /*
     * @tc.number :ArkUI_Scroll_EffectEdge_0300
     * @tc.name   :test effect edge callback
     * @tc.desc   :test whether edgeEffectiveness Options are effective
     */
    it('ArkUI_Scroll_EffectEdge_0300', 0, async (done: Function) => {
      let json1 = getInspectorByKey('list2')
      await sleep(1000)
      let obj: ESObject = JSON.parse(json1);
      let value: string = obj.$attrs?.edgeEffectOptions?.effectEdge;
      console.log('ArkUI_Scroll_EffectEdge_0300 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_0300 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.End')
      done()
    });

    /*
     * @tc.number :ArkUI_Scroll_EffectEdge_0400
     * @tc.name   :test effect edge callback
     * @tc.desc   :test whether edgeEffectiveness Options are effective
     */
    it('ArkUI_Scroll_EffectEdge_0400', 0, async (done: Function) => {
      let json1 = getInspectorByKey('grid3')
      await sleep(1000)
      let obj: ESObject = JSON.parse(json1);
      let value: string = obj.$attrs?.edgeEffectOptions?.effectEdge;
      console.log('ArkUI_Scroll_EffectEdge_0400 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_0400 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.All')
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
