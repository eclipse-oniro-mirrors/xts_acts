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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;
export default function rectEventTest() {
    describe('rectEventTest', (): void => {
      beforeAll(async (): Promise<void> => {
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName:'entry',
          onAbilityCreate: (abilitys : UIAbility) : void => {
            testAbilityContext = abilitys.context
          },
        }, (err : BusinessError | null) : void => {
          if (err != null ) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.internetvideoplaybackthreetest.static')
        await Utils.msSleep(5000)
        console.log('beforeAll end,%s', 'Succeed!')
      });
      beforeEach(async () => {
        console.info('web beforeEach start');
      })
    /**
    * @tc.name          rectEventStatic0100
    * @tc.number        rectEvent0100
    * @tc.desc          test rectEvent x
    * @tc.size          MediumTest
    * @tc.type          Function
    * @tc.level         Level 3
    */
    it('rectEventStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("rectEvent0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("rectEvent0100", 0, 202503222, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name        rectEventStatic0200
     * @tc.number       rectEvent0200
     * @tc.desc        test rectEvent y
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('rectEventStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("rectEvent0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("rectEvent0200", 0, 202503223, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name       rectEventStatic0300
     * @tc.number        rectEvent0300
     * @tc.desc        test rectEvent width
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('rectEventStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("rectEvent0300", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("rectEvent0300", 450, 202503224, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name       rectEventStatic0400
     * @tc.number        rectEvent0400
     * @tc.desc        test rectEvent height
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('rectEventStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("rectEvent0400", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("rectEvent0400", 225, 202503225, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0100
     * @tc.number       MediaInfo0100
     * @tc.desc         test MediaInfo embedID
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0100", "1", 202503226, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0200
     * @tc.number       MediaInfo0200
     * @tc.desc         test MediaInfo mediaType
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0200", 0, 202503227, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0300
     * @tc.number       MediaInfo0300
     * @tc.desc         test MediaInfo controlsShown
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0300", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0300", true, 202503228, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0400
     * @tc.number       MediaInfo0400
     * @tc.desc         test MediaInfo controlList
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0400", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0400", 2, 202503229, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0500
     * @tc.number       MediaInfo0500
     * @tc.desc         test MediaInfo muted
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0500", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0500", false, 202503230, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0600
     * @tc.number       MediaInfo0600
     * @tc.desc         test MediaInfo posterUrl
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0600", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0600", '', 202503231, done,);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0700
     * @tc.number       MediaInfo0700
     * @tc.desc         test MediaInfo headers
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0700", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0700", 146, 202503232, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0800
     * @tc.number       MediaInfo0800
     * @tc.desc         test MediaInfo attributes
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0800", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0800",68, 202503233, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic0900
     * @tc.number       MediaInfo0900
     * @tc.desc         test MediaInfo muted
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo0900", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo0900",true, 202503234, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaInfoStatic1000
     * @tc.number       MediaInfo1000
     * @tc.desc         test MediaInfo muted
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaInfoStatic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaInfo1000", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaInfo1000",false, 202503235, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaSourceInfoStatic0100
     * @tc.number       MediaSourceInfo0100
     * @tc.desc         test MediaSourceInfo type
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaSourceInfoStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaSourceInfo0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaSourceInfo0100",0, 202503236, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name         MediaSourceInfoStatic0200
     * @tc.number       MediaSourceInfo0200
     * @tc.desc         test MediaSourceInfo format
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 3
     */
    it('MediaSourceInfoStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("MediaSourceInfo0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("MediaSourceInfo0200","mpeg", 202503237, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('surfaceInfoButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
