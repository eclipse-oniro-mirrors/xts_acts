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


export default function CanvasAPITest() {

  const SUITE: string = 'CanvasAPI'
  describe('CanvasAPITest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasAPI",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("CanvasAPI" == pages.name)) {
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
     *tc.number ArkUI_Canvas_API_0100
     *tc.name   Path2D.addPath and CanvasPattern.setTransform support Matrix2D
     *tc.desc   Path2D.addPath and CanvasPattern.setTransform support Matrix2D
     */
    it('ArkUI_Canvas_API_0100', 0, async (done: Function) => {
      let CASE: string = 'ArkUI_Canvas_API_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson: string = getInspectorByKey('CanvasAPI_Canvas1')
      expect(JSON.parse(strJson).$type).assertEqual('Canvas')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });
  })
}
