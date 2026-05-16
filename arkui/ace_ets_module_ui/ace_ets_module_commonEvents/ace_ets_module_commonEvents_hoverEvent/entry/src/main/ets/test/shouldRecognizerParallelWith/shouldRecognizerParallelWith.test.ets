/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function shouldRecognizerParallelWith() {
  describe('shouldRecognizerParallelWith', () => {
    beforeEach(async (done: Function) => {
      console.info("shouldRecognizerParallelWith beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shouldRecognizerParallelWith state pages:" + JSON.stringify(pages));
        if (!("shouldRecognizerParallelWith" == pages.name)) {
          console.info("get  shouldRecognizerParallelWith pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/shouldRecognizerParallelWith/shouldRecognizerParallelWith"
          })
          await CommonFunc.sleep(2000);
          console.info("push shouldRecognizerParallelWith page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shouldRecognizerParallelWith page error:" + err);
      }
      console.info("shouldRecognizerParallelWith foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("shouldRecognizerParallelWith after each called");
    });


    /**
     * @tc.name   SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100
     * @tc.number SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100
     * @tc.desc   SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
   it('SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100', Level.LEVEL0, async (done: Function) => {
  console.info('[SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100] START');
  await CommonFunc.sleep(1000);

  // 获取子控件区域位置
  let areaObj1 = CommonFunc.getComponentRectOnScreen('FatherControlChildTest1_inner_0');
  let areaHeight = areaObj1.bottom - areaObj1.top;
  let areaWidth = areaObj1.right - areaObj1.left;
  console.log('SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100 item height and width', areaHeight, areaWidth);

  // 子控件滚动（仅保留这一步）
  let driver = Driver.create();
  await driver.swipe(
    Math.round(areaObj1.left + areaWidth / 2),
    Math.round(areaObj1.bottom - areaHeight * 0.2),
    Math.round(areaObj1.left + areaWidth / 2),
    Math.round(areaObj1.top)
  );
  await CommonFunc.sleep(3000);

  // 校验手势识别生效
  let strJson1 = getInspectorByKey('recognizer_text');
  console.info('[SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100] component strJson1 is: ' + JSON.stringify(JSON.parse(strJson1)));
  console.info('[SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100] strJson1 content: ' + JSON.stringify(JSON.parse(strJson1).$attrs.content));
  expect(JSON.parse(strJson1).$attrs.content).assertEqual('start');

  await CommonFunc.sleep(1000);
  console.info('[SUB_ARKUI_MouseEvent_shouldRecognizerParallelWith_0100] END');
  done();
});
  })
}
