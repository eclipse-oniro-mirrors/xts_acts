/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Matrix4TransitNullTest() {
  describe('Matrix4TransitNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('Matrix4TransitNull beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/matrix4/Matrix4TransitNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get Matrix4TransitNull state pages: ' + JSON.stringify(pages));
        if (!('Matrix4TransitNull' == pages.name)) {
          console.info('get Matrix4TransitNull  state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info('push Matrix4TransitNull  success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push Matrix4TransitNull page error:' + err);
      }
      console.info('Matrix4TransitNull beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('Matrix4TransitNull after each called');
    });

    /**
     * @tc.name   matrix4CombineNull_0100
     * @tc.number matrix4CombineNull_0100
     * @tc.desc   Test Matrix4 combine method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('matrix4CombineNull_0100', Level.LEVEL0, async () => {
      console.info('[matrix4CombineNull_0100] START');
      try {
        // 验证页面加载成功且方法能正常调用
        let strJsonCompare: string = getInspectorByKey('combineId');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info('[matrix4CombineNull_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
        console.info('[matrix4CombineNull_0100] default obj transform is: '
         + JSON.stringify(objCompare.$attrs?.transform));
        console.info('[matrix4CombineNull_0100] default obj combine is: '
         + JSON.stringify(objCompare.$attrs?.transform?.combine));
        expect(objCompare.$attrs?.transform?.combine).assertEqual(undefined);
        console.info('[matrix4CombineNull_0100] END');
      } catch (error) {
        console.info('[matrix4CombineNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   matrix4TranslateNull_0100
     * @tc.number matrix4TranslateNull_0100
     * @tc.desc   Test Matrix4 translate method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('matrix4TranslateNull_0100', Level.LEVEL0, async () => {
      console.info('[matrix4TranslateNull_0100] START');
      try {
        // 验证页面加载成功且方法能正常调用
        let strJsonCompare: string = getInspectorByKey('translateId');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info('[matrix4TranslateNull_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
        console.info('[matrix4TranslateNull_0100] default obj transform is: '
         + JSON.stringify(objCompare.$attrs?.transform));
        console.info('[matrix4TranslateNull_0100] default obj translate is: '
         + JSON.stringify(objCompare.$attrs?.transform?.translate));
        expect(objCompare.$attrs?.transform?.translate).assertEqual(undefined);
        console.info('[matrix4TranslateNull_0100] END');
      } catch (error) {
        console.info('[matrix4TranslateNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   matrix4ScaleNull_0100
     * @tc.number matrix4ScaleNull_0100
     * @tc.desc   Test Matrix4 scale method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('matrix4ScaleNull_0100', Level.LEVEL0, async () => {
      console.info('[matrix4ScaleNull_0100] START');
      try {
        // 验证页面加载成功且方法能正常调用
        let strJsonCompare: string = getInspectorByKey('scaleId');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info('[matrix4ScaleNull_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
        console.info('[matrix4ScaleNull_0100] default obj transform is: ' + JSON.stringify(objCompare.$attrs?.transform));
        console.info('[matrix4ScaleNull_0100] default obj scale is: ' + JSON.stringify(objCompare.$attrs?.transform?.scale));
        expect(objCompare.$attrs?.transform?.scale).assertEqual(undefined);
        console.info('[matrix4ScaleNull_0100] END');
      } catch (error) {
        console.info('[matrix4ScaleNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   matrix4RotateNull_0100
     * @tc.number matrix4RotateNull_0100
     * @tc.desc   Test Matrix4 rotate method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('matrix4RotateNull_0100', Level.LEVEL0, async () => {
      console.info('[matrix4RotateNull_0100] START');
      try {
        // 验证页面加载成功且方法能正常调用
        let strJsonCompare: string = getInspectorByKey('rotateId');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info('[matrix4RotateNull_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
        console.info('[matrix4RotateNull_0100] default obj transform is: ' + JSON.stringify(objCompare.$attrs?.transform));
        console.info('[matrix4RotateNull_0100] default obj rotate is: ' + JSON.stringify(objCompare.$attrs?.transform?.rotate));
        expect(objCompare.$attrs?.transform?.rotate).assertEqual(undefined);
        console.info('[matrix4RotateNull_0100] END');
      } catch (error) {
        console.info('[matrix4RotateNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   matrix4TransformPointNull_0100
     * @tc.number matrix4TransformPointNull_0100
     * @tc.desc   Test Matrix4 transformPoint method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('matrix4TransformPointNull_0100', Level.LEVEL0, async () => {
      console.info('[matrix4TransformPointNull_0100] START');
      try {
        // 验证页面加载成功且方法能正常调用
        let strJsonCompare: string = getInspectorByKey('transformPointId');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info('[matrix4TransformPointNull_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
        console.info('[matrix4TransformPointNull_0100] default obj transform is: '
         + JSON.stringify(objCompare.$attrs?.transform));
        console.info('[matrix4TransformPointNull_0100] default obj transformPoint is: '
         + JSON.stringify(objCompare.$attrs?.transform?.transformPoint));
        expect(objCompare.$attrs?.transform?.transformPoint).assertEqual(undefined);
        console.info('[matrix4TransformPointNull_0100] END');
      } catch (error) {
        console.info('[matrix4TransformPointNull_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })
  })
}
