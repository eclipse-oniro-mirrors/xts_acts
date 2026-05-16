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
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../../src/test/List.test';
import common from '@ohos.app.ability.common';
import cameraObj from '@ohos.multimedia.camera';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
export let appContext: common.UIAbilityContext;
class MyAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      let mPicWidthMean: float = (0.5) as float;
      let mPicHeightMean: float = (0.5) as float;
      let mMETERINGPoint: cameraObj.Point = {
        x: mPicWidthMean,
        y: mPicHeightMean,
      }
      console.info(' Point x:' + mMETERINGPoint.x + ', y: ' + mMETERINGPoint.y);
    } catch (err) {
      console.error(' Point err: ' + err);
    }

    try {
      let setting: cameraObj.SettingParam = {
        skinSmoothLevel: 1,
        faceSlender: 1,
        skinTone: 1,
      }
      console.info(' SettingParam skinSmoothLevel:' + setting.skinSmoothLevel + ', faceSlender: ' + setting.faceSlender + ', skinTone: ' + setting.skinTone);
    } catch (err) {
      console.error(' SettingParam err: ' + err);
    }

    try {
      let size: cameraObj.Size = {
        height: 1,
        width: 1,
      }
      console.info(' Size height:' + size.height + ', width: ' + size.width);
    } catch (err) {
      console.error('  Size err: ' + err);
    }

    try {
      let smoothZoomInfo: cameraObj.SmoothZoomInfo = {
        duration: 1,
      }
      console.info(' SmoothZoomInfo duration:' + smoothZoomInfo.duration);
    } catch (err) {
      console.error(' SmoothZoomInfo err: ' + err);
    }

    try {
      let sketchStatusData: cameraObj.SketchStatusData = {
        status: 1,
        sketchRatio: (1.0) as float,
        centerPointOffset: { x: (1.0) as float, y: (1.0) as float } as cameraObj.Point,
      }
      console.info('SketchStatusData status:' + sketchStatusData.status + ', sketchRatio: ' + sketchStatusData.sketchRatio);
    } catch (err) {
      console.error('SketchStatusData err: ' + err);
    }

    try {
      let location: cameraObj.Location = {
        latitude: 1.0,
        longitude: 1.0,
        altitude: 1.0,
      }
      console.info('Location latitude:' + location.latitude + ', longitude: ' + location.longitude + ', altitude: ' + location.altitude);
    } catch (err) {
      console.error('Location err: ' + err);
    }

    try {
      hilog.info(0x0000, 'testTag', 'MyAbility onCreate');
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
      abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
      if (abilityDelegatorArguments != undefined) {
        hilog.info(0x0000, 'testTag', '  abilityDelegatorArguments is not undefined');
      } else {
        hilog.info(0x0000, 'testTag', '  abilityDelegatorArguments is undefined');
      }
      let pathDir = this.context.filesDir
      Hypium.set('pathDir', pathDir)
      Hypium.set('Context', this.context)
      let hypiumTestAsync = async (abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
      abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs, testsuite: () => void) => {
      const worker = new EAWorker();
      worker.start();
      const job = worker.run<void>(Hypium.hypiumTest, abilityDelegator, abilityDelegatorArguments, testsuite);
      job.Await();
      worker.join();
      };
      hypiumTestAsync(abilityDelegator, abilityDelegatorArguments, testsuite);
      hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate end');
    } catch (err) {
      hilog.error(0x0000, 'testTag', '  onCreate err: ' + err);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '  EntryAbility onWindowStageCreate');
    try {
      let pathDir = this.context.filesDir
      Hypium.set('pathDir', pathDir)
      Hypium.set('Context', this.context)
      hilog.info(0x0000, 'testTag', '  set pathDir: ' + pathDir);
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err!.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }

  onBackground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}