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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  Point,
  ON,
  BY,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import render from 'libnativerender.so';
import native from 'libnativefunc.so'
import { NodeContent } from '@kit.ArkUI';

export default function dragEventFuncTest() {

  describe('dragEventFuncTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number   dragEventFuncTest041
     * @tc.name     dragEventFuncTest041
     * @tc.desc     testing errorCode
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('dragEventFuncTest041', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest041 START-----');
      let PAGE_TAG = 'dragEventFuncTest041';
      await Utils.pushPage(`dragEvent/${PAGE_TAG}`);
      await Utils.sleep(1000);

      let driver = await Driver.create();
      await Utils.sleep(500);
      let g_Node = await driver.findComponent(ON.id('keyevent'));
      await Utils.sleep(500);
      let point = await g_Node.getBoundsCenter();
      await Utils.sleep(500);
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_LEFT, 2017);
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('keyevent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragEventFuncTest041]:" + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFCC00CC');
      await Utils.sleep(1000)
      done();
    });

    /**
     * @tc.number   dragEventFuncTest001
     * @tc.name     dragEventFuncTest001
     * @tc.desc     testing errorCode
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('dragEventFuncTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest001 START-----');
      expect(native.dragEventFuncTest001()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest000
     * @tc.number dragEventFuncTest000
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest000', Level.LEVEL1, async (done: Function) => {
      console.info('dragEventFuncTest000 START');
      await Utils.pushPage(`dragEvent/dragEventFuncTest`)
      await Utils.sleep(2000)

      let driver = await Driver.create();
      let grid = await driver.findComponent(ON.id('image_'));
      let button = await driver.findComponent(ON.id('dragArea_'));

      //await Utils.sleep(2000);
      await grid.dragTo(button);
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('image_');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragEventGetDisplayId_0001]:" + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      await Utils.sleep(1000)

      let strJson1 = getInspectorByKey('dragArea_');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.backgroundColor).assertEqual('#FFFFFFFF');

      console.info('dragEventFuncTest000 END-----------');
      done();
    });

    /**
     * @tc.name   dragEventFuncTest002
     * @tc.number dragEventFuncTest002
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest002 START-----');
      expect(native.dragEventFuncTest002()).assertEqual(0)
      done();
    });


    /**
     * @tc.name   dragEventFuncTest003
     * @tc.number dragEventFuncTest003
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest003 START-----');
      expect(native.dragEventFuncTest003()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest004
     * @tc.number dragEventFuncTest004
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest004 START-----');
      expect(native.dragEventFuncTest004()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest005
     * @tc.number dragEventFuncTest005
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest005 START-----');
      expect(native.dragEventFuncTest005()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest006
     * @tc.number dragEventFuncTest006
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest006 START-----');
      expect(native.dragEventFuncTest006()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest007
     * @tc.number dragEventFuncTest007
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest007 START-----');
      expect(native.dragEventFuncTest007()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest008
     * @tc.number dragEventFuncTest008
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest008 START-----');
      expect(native.dragEventFuncTest008()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest009
     * @tc.number dragEventFuncTest009
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest009 START-----');
      expect(native.dragEventFuncTest009()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest010
     * @tc.number dragEventFuncTest010
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest010 START-----');
      expect(native.dragEventFuncTest010()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest011
     * @tc.number dragEventFuncTest011
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest011 START-----');
      expect(native.dragEventFuncTest011()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest012
     * @tc.number dragEventFuncTest012
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest012 START-----');
      expect(native.dragEventFuncTest012()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest013
     * @tc.number dragEventFuncTest013
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest013 START-----');
      expect(native.dragEventFuncTest013()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest015
     * @tc.number dragEventFuncTest015
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest015 START-----');
      expect(native.dragEventFuncTest015()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest016
     * @tc.number dragEventFuncTest016
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest016 START-----');
      expect(native.dragEventFuncTest016()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest017
     * @tc.number dragEventFuncTest017
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest017 START-----');
      expect(native.dragEventFuncTest017()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest018
     * @tc.number dragEventFuncTest018
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest018 START-----');
      expect(native.dragEventFuncTest018()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest019
     * @tc.number dragEventFuncTest019
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest019 START-----');
      expect(native.dragEventFuncTest019()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest020
     * @tc.number dragEventFuncTest020
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest020 START-----');
      expect(native.dragEventFuncTest020()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest021
     * @tc.number dragEventFuncTest021
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest021 START-----');
      expect(native.dragEventFuncTest021()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest022
     * @tc.number dragEventFuncTest022
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest022 START-----');
      expect(native.dragEventFuncTest022()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest023
     * @tc.number dragEventFuncTest023
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest023 START-----');
      expect(native.dragEventFuncTest023()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest024
     * @tc.number dragEventFuncTest024
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest024 START-----');
      expect(native.dragEventFuncTest024()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest026
     * @tc.number dragEventFuncTest026
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest026', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest026 START-----');
      expect(native.dragEventFuncTest026()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest027
     * @tc.number dragEventFuncTest027
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest027', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest027 START-----');
      expect(native.dragEventFuncTest027()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest028
     * @tc.number dragEventFuncTest028
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest028', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest028 START-----');
      expect(native.dragEventFuncTest028()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest029
     * @tc.number dragEventFuncTest029
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest029', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest029 START-----');
      expect(native.dragEventFuncTest029()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest030
     * @tc.number dragEventFuncTest030
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest030 START-----');
      expect(native.dragEventFuncTest030()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest031
     * @tc.number dragEventFuncTest031
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest031', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest031 START-----');
      expect(native.dragEventFuncTest031()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest032
     * @tc.number dragEventFuncTest032
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest032', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest032 START-----');
      expect(native.dragEventFuncTest032()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest033
     * @tc.number dragEventFuncTest033
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest033', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest033 START-----');
      expect(native.dragEventFuncTest033()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest034
     * @tc.number dragEventFuncTest034
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest034', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest034 START-----');
      expect(native.dragEventFuncTest034()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest035
     * @tc.number dragEventFuncTest035
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest035', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest035 START-----');
      expect(native.dragEventFuncTest035()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest036
     * @tc.number dragEventFuncTest036
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest036', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest036 START-----');
      let PAGE_TAG = 'DragEventFuncTest036';
      await Utils.pushPage(`dragEvent/${PAGE_TAG}`);
      let driver = await Driver.create();
      await Utils.sleep(1000);
      let Column = await driver.findComponent(ON.id('ColumnID'));
      await Utils.sleep(500);
      let rect = await Column.getBounds();
      await Utils.sleep(500);
      await driver.swipe(Math.round(rect.left + 200), Math.round(rect.top + 200), Math.round(rect.left + 1),
        Math.round(rect.top + 1), 600);
      await Utils.sleep(1000);

      expect(render.GetPanGesture036Ret()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest037
     * @tc.number dragEventFuncTest037
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest037', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest037 START-----');
      let PAGE_TAG = 'DragEventFuncTest037';
      await Utils.pushPage(`dragEvent/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create();
      await driver.triggerCombineKeys(2072, 2047, 2035);
      await driver.triggerKey(2017);
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('keyevent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragEventFuncTest037]:" + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      await Utils.sleep(1000)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest038
     * @tc.number dragEventFuncTest038
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest038', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest038 START-----');
      expect(native.dragEventFuncTest038()).assertEqual(0)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest039
     * @tc.number dragEventFuncTest039
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest039', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest039 START-----');
      let PAGE_TAG = 'DragEventFuncTest039';
      await Utils.pushPage(`dragEvent/${PAGE_TAG}`);
      await Utils.sleep(2000);

      let driver = await Driver.create();
      await Utils.sleep(1000);
      let image = await driver.findComponent(ON.id('image'));
      await Utils.sleep(500);
      let rect = await image.click();
      await Utils.sleep(500);

      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragEventFuncTest039]:" + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFF000');
      await Utils.sleep(1000)
      done();
    });

    /**
     * @tc.name   dragEventFuncTest040
     * @tc.number dragEventFuncTest040
     * @tc.desc   testing errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dragEventFuncTest040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('dragEventFuncTest040 START-----');
      expect(native.dragEventFuncTest040()).assertEqual(0)
      done();
    });

  })
}