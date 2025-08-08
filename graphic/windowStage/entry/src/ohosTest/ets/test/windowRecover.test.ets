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
import { describe, beforeAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


export default function windowRecoverTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  describe('windowRecover_test', () => {
    console.log('describe window_api_test start')
    beforeAll(async () => {
      console.log('describe screenHotTest start!!!')
      try {
        let cmd = "hdc shell hihdumper -s WindowManagerService -a '-a'";
        await abilityDelegator.executeShellCommand(cmd).then((result) => {
          console.info(`executeShellCommand result: ` + JSON.stringify(result.stdResult));
        }).catch(((err: BusinessError) => {
          console.info(`executeShellCommand catch:` + err);
          expect().assertFail();
        }))
      } catch (err) {
        console.info(`executeShellCommand exception: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
     * @tc.name      : testRecover
     * @tc.desc      : test the function of Recover
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testRecover', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testRecover';
      console.log(msgStr + ' begin');
      try {
        let wnd = await windowStage.getMainWindow();
        console.log(msgStr + ' window.getMainWindow wnd: ' + wnd);
        let promise = wnd.recover();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in recovering the window.');
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801 || err.code == 1300001) {
            console.log(msgStr + ' The current device type does not support calling recover or recover not support ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(msgStr + ' Failed to testRecover. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3940
     * @tc.name      : testMaximize
     * @tc.desc      : test the function of Maximize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testMaximize';
      console.log(msgStr + ' begin');
      try {
        let wnd = await windowStage.getMainWindow();
        console.log(msgStr + ' window.getMainWindow wnd: ' + wnd);
        let promise = wnd.recover();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.maximize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from recovering to maximizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.log(msgStr + ' The current device type does not support calling maximize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if (err.code == 801 || err.code == 1300001) {
            console.log(msgStr + ' The current device type does not support calling recover ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(msgStr + ' Failed to testMaximize. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3950
     * @tc.name      : testMaximizeToRecover
     * @tc.desc      : test the function of MaximizeToRecover
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximizeToRecover', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testMaximizeToRecover';
      console.log(msgStr + ' begin');
      try {
        let wnd = await windowStage.getMainWindow();
        console.log(msgStr + ' window.getMainWindow wnd: ' + wnd);
        let promise = wnd.maximize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.recover()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from maximizing to recovering the window ')
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.log(msgStr + ' The current device type does not support calling recover ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.log(msgStr + ' The current device type does not support calling maximize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(msgStr + ' Failed to testMaximizeToRecover. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }



    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4280
     * @tc.name      : testMaximizeToMinimize
     * @tc.desc      : test the function of MaximizeToMinimize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximizeToMinimize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testMaximizeToMinimize';
      console.log(msgStr + ' begin');
      try {
        let wnd = await windowStage.getMainWindow();
        console.log(msgStr + ' window.getMainWindow wnd: ' + wnd);
        let promise = wnd.maximize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.minimize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from maximizing to minimizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.log(msgStr + ' The current device type does not support calling minimize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to minimize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.log(msgStr + ' The current device type does not support calling maximize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(msgStr + ' Failed to testMaximizeToMinimize. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }


    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4290
     * @tc.name      : testMinimizeToMaximize
     * @tc.desc      : test the function of MinimizeToMaximize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMinimizeToMaximize', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testMinimizeToMaximize';
      console.log(msgStr + ' begin');
      try {
        let wnd = await windowStage.getMainWindow();
        console.log(msgStr + ' window.getMainWindow wnd: ' + wnd);
        let promise = wnd.minimize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in minimizing the window.');
          let currentWnd = wnd.maximize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from minimizing to maximizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.log(msgStr + ' The current device type does not support calling maximize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.log(msgStr + ' The current device type does not support calling minimize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to minimize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(msgStr + ' Failed to testMinimizeToMaximize. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      }


    })
  })
}
