'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';

export default function imageJsunit() {
  describe('imageTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image',
      }
      try {
        const alphabetIndexer = AppStorage.get<Router>("router") as Router
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get image state success " + JSON.stringify(pages));
        if (!("image" == pages.name)) {
          console.info("get image state success " + JSON.stringify(pages.name));
          alphabetIndexer.pushUrl(options);
          await UtilsTest.msSleep(1000);
        }
      } catch (err) {
        console.error("push image page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   imageTest_static_0001
     * @tc.name     imageTest_static_0001
     * @tc.desc     imageTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info('imageTest_static_0001 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0002
     * @tc.name     imageTest_static_0002
     * @tc.desc     imageTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('colorFilter'))
        .assertEqual("1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ");
      console.info('imageTest_static_0002 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0003
     * @tc.name     imageTest_static_0003
     * @tc.desc     imageTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0003 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('syncLoad')).assertEqual("true");
      console.info('imageTest_static_0003 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0004
     * @tc.name     imageTest_static_0004
     * @tc.desc     imageTest_static_0004
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0004 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('sourceSize')).assertEqual('[200.00 x 100.00]');
      console.info('imageTest_static_0004 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0005
     * @tc.name     imageTest_static_0005
     * @tc.desc     imageTest_static_0005
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0005 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('interpolation')).assertEqual("ImageInterpolation.None");
      console.info('imageTest_static_0005 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0006
     * @tc.name     imageTest_static_0006
     * @tc.desc     imageTest_static_0006
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0006 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('renderMode')).assertEqual("ImageRenderMode.Original");
      console.info('imageTest_static_0006 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0007
     * @tc.name     imageTest_static_0007
     * @tc.desc     imageTest_static_0007
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0007 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('autoResize')).assertEqual("true");
      console.info('imageTest_static_0007 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0008
     * @tc.name     imageTest_static_0008
     * @tc.desc     imageTest_static_0008
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0008 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0008 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('objectRepeat')).assertEqual("ImageRepeat.NoRepeat");
      console.info('imageTest_static_0008 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0009
     * @tc.name     imageTest_static_0009
     * @tc.desc     imageTest_static_0009
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0009 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0009 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('objectFit')).assertEqual("ImageFit.None");
      console.info('imageTest_static_0009 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0010
     * @tc.name     imageTest_static_0010
     * @tc.desc     imageTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0010 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0010 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fillColor')).assertEqual("#FF182431");
      console.info('imageTest_static_0010 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0011
     * @tc.name     imageTest_static_0011
     * @tc.desc     imageTest_static_0011
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0011 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0011 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fitOriginalSize')).assertEqual("true");
      console.info('imageTest_static_0011 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0012
     * @tc.name     imageTest_static_0012
     * @tc.desc     imageTest_static_0012
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0012 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0012 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('matchTextDirection')).assertEqual("true");
      console.info('imageTest_static_0012 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0013
     * @tc.name     imageTest_static_0013
     * @tc.desc     imageTest_static_0013
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0013 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0013 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('alt')).assertEqual("aaa");
      console.info('imageTest_static_0013 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0014
     * @tc.name     imageTest_static_0014
     * @tc.desc     imageTest_static_0014
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('imageTest_static_0014 START');
      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0014 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('draggable')).assertEqual("false");
      console.info('imageTest_static_0014 END');
      done();
    });

    
    
    /**
     * @tc.number   imageTest_static_0015
     * @tc.name     imageTest_static_0015
     * @tc.desc     imageTest_static_0015
     * @tc.level    Level.LEVEL0
     */
it('imageTest_static_0015', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('imageTest_static_0015 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
      await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('image');

      console.info("imageTest_static_0015 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('syncLoad')).assertEqual("true");
      console.info('imageTest_static_0015 END');
      done();
    });
  })
}