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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'

export default function ListReboundTest() {

  const SUITE: string = 'ListRebound'

  describe('ListReboundTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListRebound",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListRebound" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUI_Rebound_0100
     * @tc.number ArkUI_Rebound_0100
     * @tc.desc   Grid with EdgeEffect.Spring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Rebound_0100', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_Rebound_0100'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyGrid1'
      setTimeout(async () => {
        try {
          let strJson: string = getInspectorByKey(baseKey);
          expect(JSON.parse(strJson).$attrs.edgeEffect).assertEqual('EdgeEffect.Spring')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUI_Rebound_0200
     * @tc.number ArkUI_Rebound_0200
     * @tc.desc   Grid with EdgeEffect.Fade
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Rebound_0200', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_Rebound_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyGrid2'
      setTimeout(async () => {
        try {
          let strJson: string = getInspectorByKey(baseKey);

          expect(JSON.parse(strJson).$attrs.edgeEffect).assertEqual('EdgeEffect.Fade')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUI_Rebound_0300
     * @tc.number ArkUI_Rebound_0300
     * @tc.desc   Grid with EdgeEffect.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Rebound_0300', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_Rebound_0300'
      console.info(`${SUITE} ${CASE} START`);
      let baseKey: string = 'MyGrid3'
      setTimeout(async () => {
        try {
          let strJson: string = getInspectorByKey(baseKey);
          expect(JSON.parse(strJson).$attrs.edgeEffect).assertEqual('EdgeEffect.None')
          console.info(`${SUITE} ${CASE} END`);
        } catch (err) {
          expect().assertFail();
          console.info(`${SUITE} ${CASE} ERROR:` + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}

function getRectCenter(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, ',').split(',')
  return [
    px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}