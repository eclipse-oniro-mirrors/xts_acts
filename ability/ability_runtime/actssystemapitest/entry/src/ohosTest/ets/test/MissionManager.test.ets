/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import missionManager from "@ohos.app.ability.missionManager"
import { BusinessError } from '@ohos.base';

let ERROR_CODE = 202;

export default function missionManagerTest() {
  describe('missionManagerTest', () => {

    /**
     * @tc.number: System_API_Test_Mission_Manager_0100
     * @tc.name: missionManager.on system interface interception test
     * @tc.desc: Test the third-party application call missionManager.on will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0100';
      let listener: missionManager.MissionListener = {
        onMissionCreated: (mission) => {
          console.log("--------onMissionCreated-------")
        },
        onMissionDestroyed: (mission) => {
          console.log("--------onMissionDestroyed-------")
        },
        onMissionSnapshotChanged: (mission) => {
          console.log("--------onMissionSnapshotChanged-------")
        },
        onMissionLabelUpdated: (mission) => {
          console.log("--------onMissionLabelUpdated-------")
        },
        onMissionMovedToFront: (mission) => {
          console.log("--------onMissionMovedToFront-------")
        },
        onMissionIconUpdated: (mission, icon) => {
          console.log("--------onMissionIconUpdated-------")
        },
        onMissionClosed: (mission) => {
          console.log("--------onMissionClosed-------")
        }
      };
      try {
        const observerCode = missionManager.on("mission", listener);
        console.log('-------- observerCode: ---------', observerCode);
      } catch (err) {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0200
     * @tc.name: callback form getMissionInfo system interface interception test
     * @tc.desc: Test the third-party application call getMissionInfo will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0200';
      let deviceId: string = "deviceId";
      let missionId = 0;
      missionManager.getMissionInfo(deviceId, missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0300
     * @tc.name: promise form getMissionInfo system interface interception test
     * @tc.desc: Test the third-party application call getMissionInfo will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0300';
      let deviceId: string = "deviceId";
      let missionId: number = 0;
      missionManager.getMissionInfo(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0400
     * @tc.name: callback form getMissionInfos system interface interception test
     * @tc.desc: Test the third-party application call getMissionInfos will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0400';
      let deviceId: string = "deviceId";
      let numMax: number = 10;
      missionManager.getMissionInfos(deviceId, numMax, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0500
     * @tc.name: promise form getMissionInfos system interface interception test
     * @tc.desc: Test the third-party application call getMissionInfos will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0500';
      let deviceId: string = "deviceId";
      let numMax: number = 10;
      missionManager.getMissionInfos(deviceId, numMax)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0600
     * @tc.name: callback form getMissionSnapShot system interface interception test
     * @tc.desc: Test the third-party application call getMissionSnapShot will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0600';
      let deviceId: string = "deviceId";
      let missionId: number = 0;
      missionManager.getMissionSnapShot(deviceId, missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0700
     * @tc.name: promise form isRequestPublishFormSupported system interface interception test
     * @tc.desc: Test the third-party application call isRequestPublishFormSupported will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0700';
      let deviceId: string = "deviceId";
      let missionId: number = 0;
      missionManager.getMissionSnapShot(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0800
     * @tc.name: promise form getLowResolutionMissionSnapShot system interface interception test
     * @tc.desc: Test the third-party application call getLowResolutionMissionSnapShot will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0800', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0800';
      let deviceId: string = "deviceId";
      let missionId = 0;
      missionManager.getLowResolutionMissionSnapShot(deviceId, missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0900
     * @tc.name: promise form getLowResolutionMissionSnapShot system interface interception test
     * @tc.desc: Test the third-party application call getLowResolutionMissionSnapShot will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_0900', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_0900';
      let deviceId: string = "deviceId";
      let missionId = 0;
      missionManager.getLowResolutionMissionSnapShot(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1000
     * @tc.name: callback form lockMission system interface interception test
     * @tc.desc: Test the third-party application call lockMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1000', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1000';
      let missionId: number = 0;
      missionManager.lockMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1100
     * @tc.name: promise form lockMission system interface interception test
     * @tc.desc: Test the third-party application call lockMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1100';
      let missionId: number = 0;
      missionManager.lockMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1200
     * @tc.name: callback form unlockMission system interface interception test
     * @tc.desc: Test the third-party application call unlockMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1200';
      let missionId: number = 0;
      missionManager.unlockMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1300
     * @tc.name: promise form unlockMission system interface interception test
     * @tc.desc: Test the third-party application call unlockMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1300';
      let missionId: number = 0;
      missionManager.unlockMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1400
     * @tc.name: callback form clearMission system interface interception test
     * @tc.desc: Test the third-party application call clearMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1400';
      let missionId: number = 0;
      missionManager.clearMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1500
     * @tc.name: promise form clearMission system interface interception test
     * @tc.desc: Test the third-party application call clearMission will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1500';
      let missionId = 0;
      missionManager.clearMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1600
     * @tc.name: callback form clearAllMissions system interface interception test
     * @tc.desc: Test the third-party application call clearAllMissions will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1600';
      missionManager.clearAllMissions((err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1700
     * @tc.name: promise form clearAllMissions system interface interception test
     * @tc.desc: Test the third-party application call clearAllMissions will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1700';
      missionManager.clearAllMissions()
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1800
     * @tc.name: callback form moveMissionToFront system interface interception test
     * @tc.desc: Test the third-party application call moveMissionToFront will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1800', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1800';
      let missionId: number = 0;
      missionManager.moveMissionToFront(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1900
     * @tc.name: promise form moveMissionToFront system interface interception test
     * @tc.desc: Test the third-party application call moveMissionToFront will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_1900', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_1900';
      let missionId: number = 0;
      missionManager.moveMissionToFront(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2000
     * @tc.name: Multi-parameter moveMissionToFront system interface interception test in the form of callback
     * @tc.desc: Test the third-party application call moveMissionToFront will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2000', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2000';
      let missionId: number = 0;
      missionManager.moveMissionToFront(missionId, {
        windowMode: 101
      }, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2100
     * @tc.name: Multi-parameter moveMissionToFront system interface interception test in the form of promise
     * @tc.desc: Test the third-party application call moveMissionToFront will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2100';
      let missionId: number = 0;
      missionManager.moveMissionToFront(missionId, {
        windowMode: 101
      })
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2200
     * @tc.name: callback form moveMissionsToForeground system interface interception test
     * @tc.desc: Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2200';
      let missionIds: number[] = [1, 2, 3];
      missionManager.moveMissionsToForeground(missionIds, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2300
     * @tc.name: promise form moveMissionsToForeground system interface interception test
     * @tc.desc: Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2300';
      let missionIds: number[] = [1, 2, 3];
      missionManager.moveMissionsToForeground(missionIds)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2400
     * @tc.name: Multi-parameter moveMissionsToForeground system interface interception test in the form of callback
     * @tc.desc: Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2400';
      let missionIds: number[] = [1, 2, 3];
      let topMission: number = 2;
      missionManager.moveMissionsToForeground(missionIds, topMission, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2500
     * @tc.name: Multi-parameter moveMissionsToForeground system interface interception test in the form of promise
     * @tc.desc: Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2500';
      let missionIds: number[] = [1, 2, 3];
      let topMission: number = 2;
      missionManager.moveMissionsToForeground(missionIds, topMission)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2600
     * @tc.name: callback form moveMissionsToBackground system interface interception test
     * @tc.desc: Test the third-party application call moveMissionsToBackground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2600';
      let missionIds: number[] = [1, 2, 3];
      missionManager.moveMissionsToBackground(missionIds, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2700
     * @tc.name: promise form moveMissionsToBackground system interface interception test
     * @tc.desc: Test the third-party application call moveMissionsToBackground will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Mission_Manager_2700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Mission_Manager_2700';
      let missionIds: number[] = [1, 2, 3];
      missionManager.moveMissionsToBackground(missionIds)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })
  })
}