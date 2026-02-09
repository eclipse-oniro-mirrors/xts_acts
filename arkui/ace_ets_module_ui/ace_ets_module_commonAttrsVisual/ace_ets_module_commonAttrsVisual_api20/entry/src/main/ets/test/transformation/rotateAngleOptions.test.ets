/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function rotateAngleOptionsTest() {
  describe('rotateAngleOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info('rotateAngleOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/transformation/rotateAngleOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get rotateAngleOptionsTest state pages:' + JSON.stringify(pages));
        if (!('rotateAngleOptions' == pages.name)) {
          console.info('get rotateAngleOptionsTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push rotateAngleOptionsTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push rotateAngleOptionsTest page error:' + err);
      }
      console.info('rotateAngleOptionsTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   rotateAngleOptionsTest_0100
     * @tc.number rotateAngleOptionsTest_0100
     * @tc.desc   The rotateAngleOptions(angleX,Y,Z, centerX,Y,Z, perspective) value is number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateAngleOptionsTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('rotateAngleOptionsTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotate1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.angleX);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.angleY);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.angleZ);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.centerX);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.centerY);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.centerZ);
      console.info('[rotateAngleOptionsTest_0100] strJson:' + obj.$attrs.rotate.perspective);

      expect(obj.$attrs.rotate.angleX).assertEqual('10.000000');
      expect(obj.$attrs.rotate.angleY).assertEqual('20.000000');
      expect(obj.$attrs.rotate.angleZ).assertEqual('30.000000');
      expect(obj.$attrs.rotate.centerX).assertEqual('20.00vp');
      expect(obj.$attrs.rotate.centerY).assertEqual('30.00vp');
      expect(obj.$attrs.rotate.centerZ).assertEqual('0.00px');
      expect(obj.$attrs.rotate.perspective).assertEqual('0.000000');
      console.info('rotateAngleOptionsTest_0100 END');
      done();
    });

    /**
     * @tc.name   rotateAngleOptionsTest_0200
     * @tc.number rotateAngleOptionsTest_0200
     * @tc.desc   The rotateAngleOptions(angleX,Y,Z, centerX,Y,Z, perspective) value is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateAngleOptionsTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('rotateAngleOptionsTest_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotate2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateAngleOptionsTest_0200] strJson:' + obj.$attrs.rotate.angleX);
      console.info('[rotateAngleOptionsTest_0200] strJson:' + obj.$attrs.rotate.angleY);
      console.info('[rotateAngleOptionsTest_0200] strJson:' + obj.$attrs.rotate.angleZ);
      console.info('[rotateAngleOptionsTest_0200] strJson:' + obj.$attrs.rotate.centerX);
      console.info('[rotateAngleOptionsTest_0200] strJson:' + obj.$attrs.rotate.centerY);

      expect(obj.$attrs.rotate.angleX).assertEqual('10.000000');
      expect(obj.$attrs.rotate.angleY).assertEqual('20.000000');
      expect(obj.$attrs.rotate.angleZ).assertEqual('30.000000');
      expect(obj.$attrs.rotate.centerX).assertEqual('50.00%');
      expect(obj.$attrs.rotate.centerY).assertEqual('50.00%');
      console.info('rotateAngleOptionsTest_0200 END');
      done();
    });

    /**
     * @tc.name   rotateAngleOptionsTest_0300
     * @tc.number rotateAngleOptionsTest_0300
     * @tc.desc   test -angleX,-angleY,-angleZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateAngleOptionsTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('rotateAngleOptionsTest_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotate3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateAngleOptionsTest_0300] strJson:' + obj.$attrs.rotate.angleX);
      console.info('[rotateAngleOptionsTest_0300] strJson:' + obj.$attrs.rotate.angleY);
      console.info('[rotateAngleOptionsTest_0300] strJson:' + obj.$attrs.rotate.angleZ);
      expect(obj.$attrs.rotate.angleX).assertEqual('-10.000000');
      expect(obj.$attrs.rotate.angleY).assertEqual('-20.000000');
      expect(obj.$attrs.rotate.angleZ).assertEqual('-30.000000');
      console.info('rotateAngleOptionsTest_0300 END');
      done();
    });

    /**
     * @tc.name   rotateAngleOptionsTest_0400
     * @tc.number rotateAngleOptionsTest_0400
     * @tc.desc   test rotateAngleOptions is null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateAngleOptionsTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('rotateAngleOptionsTest_0400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotate4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.angleX);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.angleY);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.angleZ);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.centerX);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.centerY);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.centerZ);
      console.info('[rotateAngleOptionsTest_0400] strJson:' + obj.$attrs.rotate.perspective);

      expect(obj.$attrs.rotate.angleX).assertEqual('0.000000');
      expect(obj.$attrs.rotate.angleY).assertEqual('0.000000');
      expect(obj.$attrs.rotate.angleZ).assertEqual('0.000000');
      expect(obj.$attrs.rotate.centerX).assertEqual('50.00%');
      expect(obj.$attrs.rotate.centerY).assertEqual('50.00%');
      expect(obj.$attrs.rotate.centerZ).assertEqual('0.00px');
      expect(obj.$attrs.rotate.perspective).assertEqual('0.000000');
      console.info('rotateAngleOptionsTest_0400 END');
      done();
    });

    /**
     * @tc.name   rotateAngleOptionsTest_0500
     * @tc.number rotateAngleOptionsTest_0500
     * @tc.desc   test the value of rotateAngleOptions(angleX,Y,Z, centerX,Y,Z, perspective) is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateAngleOptionsTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('rotateAngleOptionsTest_0500 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rotate5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.angleX);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.angleY);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.angleZ);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.centerX);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.centerY);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.centerZ);
      console.info('[rotateAngleOptionsTest_0500] strJson:' + obj.$attrs.rotate.perspective);

      expect(obj.$attrs.rotate.angleX).assertEqual('0.000000');
      expect(obj.$attrs.rotate.angleY).assertEqual('0.000000');
      expect(obj.$attrs.rotate.angleZ).assertEqual('0.000000');
      expect(obj.$attrs.rotate.centerX).assertEqual('50.00%');
      expect(obj.$attrs.rotate.centerY).assertEqual('50.00%');
      expect(obj.$attrs.rotate.centerZ).assertEqual('0.00px');
      expect(obj.$attrs.rotate.perspective).assertEqual('0.000000');
      console.info('rotateAngleOptionsTest_0500 END');
      done();
    });
  })
}