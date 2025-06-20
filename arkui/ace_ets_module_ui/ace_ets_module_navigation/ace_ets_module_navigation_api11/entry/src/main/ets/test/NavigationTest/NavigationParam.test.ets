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

export default function NavigationParamTest() {

  const SUITE: string = 'NavigationParam'
  const waitUiReadyMs: number = 500;


  describe('NavigationParamTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Navigation/NavigationParam",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("NavigationParam" == pages.name)) {
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
     *tc.number ArkUI_Navigation_0100
     *tc.name   Set Navigation.title with Resource
     *tc.desc   Set Navigation.title with Resource
     */
    it('ArkUI_Navigation_0100', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Navigation_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson: string = getInspectorByKey('NavigationParam_Navigation1')
      expect(JSON.parse(strJson).$type).assertEqual('Navigation')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });

    /*
     *tc.number ArkUI_Navigation_0200
     *tc.name   Set Navigation.title with string
     *tc.desc   Set Navigation.title with string
     */
    it('ArkUI_Navigation_0200', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Navigation_0200'
      console.info(`${SUITE} ${CASE} START`)
      let strJson: string = getInspectorByKey('NavigationParam_Navigation2')
      expect(JSON.parse(strJson).$attrs.title).assertEqual('test_string_title')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });

  })
}
