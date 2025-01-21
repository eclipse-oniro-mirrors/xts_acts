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

import { describe, it, expect } from '@ohos/hypium'
import missionManager from "@ohos.app.ability.missionManager"

let ERROR_CODE = 202;
export default function missionManagerTest() {
  describe('missionManagerTest', function () {

    /**
     * @tc.number: System_API_Test_Mission_Manager_0100
     * @tc.name: missionManager.on system interface interception test
     * @tc.desc:  Test the third-party application call missionManager.on will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0100', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0100';
      let listener = {
        onMissionCreated: function (mission) { console.log("--------onMissionCreated-------") },
        onMissionDestroyed: function (mission) { console.log("--------onMissionDestroyed-------") },
        onMissionSnapshotChanged: function (mission) { console.log("--------onMissionSnapshotChanged-------") },
        onMissionLabelUpdated: function (mission) { console.log("--------onMissionLabelUpdated-------") },
        onMissionMovedToFront: function (mission) { console.log("--------onMissionMovedToFront-------") },
        onMissionIconUpdated: function (mission, icon) { console.log("--------onMissionIconUpdated-------") },
        onMissionClosed: function (mission) { console.log("--------onMissionClosed-------") }
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
     * @tc.desc:  Test the third-party application call getMissionInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0200', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0200';
      let deviceId = "deviceId";
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
     * @tc.desc:  Test the third-party application call getMissionInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0300', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0300';
      let deviceId = "deviceId";
      let missionId = 0;
      missionManager.getMissionInfo(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0400
     * @tc.name: callback form getMissionInfos system interface interception test
     * @tc.desc:  Test the third-party application call getMissionInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0400', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0400';
      let deviceId = "deviceId";
      let numMax = 10;
      missionManager.getMissionInfos(deviceId, numMax, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0500
     * @tc.name: promise form getMissionInfos system interface interception test
     * @tc.desc:  Test the third-party application call getMissionInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0500', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0500';
      let deviceId = "deviceId";
      let numMax = 10;
      missionManager.getMissionInfos(deviceId, numMax)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0600
     * @tc.name: callback form getMissionSnapShot system interface interception test
     * @tc.desc:  Test the third-party application call getMissionSnapShot will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0600', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0600';
      let deviceId = "deviceId";
      let missionId = 0;
      missionManager.getMissionSnapShot(deviceId, missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0700
     * @tc.name: promise form isRequestPublishFormSupported system interface interception test
     * @tc.desc:  Test the third-party application call isRequestPublishFormSupported will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0700', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0700';
      let deviceId = "deviceId";
      let missionId = 0;
      missionManager.getMissionSnapShot(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_0800
     * @tc.name: promise form getLowResolutionMissionSnapShot system interface interception test
     * @tc.desc:  Test the third-party application call getLowResolutionMissionSnapShot will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0800', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0800';
      let deviceId = "deviceId";
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
     * @tc.desc:  Test the third-party application call getLowResolutionMissionSnapShot will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_0900', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_0900';
      let deviceId = "deviceId";
      let missionId = 0;
      missionManager.getLowResolutionMissionSnapShot(deviceId, missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1000
     * @tc.name: callback form lockMission system interface interception test
     * @tc.desc:  Test the third-party application call lockMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1000', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1000';
      let missionId = 0;
      missionManager.lockMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1100
     * @tc.name: promise form lockMission system interface interception test
     * @tc.desc:  Test the third-party application call lockMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1100', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1100';
      let missionId = 0;
      missionManager.lockMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1200
     * @tc.name: callback form unlockMission system interface interception test
     * @tc.desc:  Test the third-party application call unlockMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1200', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1200';
      let missionId = 0;
      missionManager.unlockMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1300
     * @tc.name: promise form unlockMission system interface interception test
     * @tc.desc:  Test the third-party application call unlockMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1300', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1300';
      let missionId = 0;
      missionManager.unlockMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1400
     * @tc.name: callback form clearMission system interface interception test
     * @tc.desc:  Test the third-party application call clearMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1400', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1400';
      let missionId = 0;
      missionManager.clearMission(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1500
     * @tc.name: promise form clearMission system interface interception test
     * @tc.desc:  Test the third-party application call clearMission will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1500', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1500';
      let missionId = 0;
      missionManager.clearMission(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1600
     * @tc.name: callback form clearAllMissions system interface interception test
     * @tc.desc:  Test the third-party application call clearAllMissions will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1600', 0, function (done) {
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
     * @tc.desc:  Test the third-party application call clearAllMissions will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1700', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1700';
      missionManager.clearAllMissions()
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1800
     * @tc.name: callback form moveMissionToFront system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionToFront will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1800', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1800';
      let missionId = 0;
      missionManager.moveMissionToFront(missionId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_1900
     * @tc.name: promise form moveMissionToFront system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionToFront will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_1900', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_1900';
      let missionId = 0;
      missionManager.moveMissionToFront(missionId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2000
     * @tc.name: Multi-parameter moveMissionToFront system interface interception test in the form of callback
     * @tc.desc:  Test the third-party application call moveMissionToFront will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2000', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2000';
      let missionId = 0;
      missionManager.moveMissionToFront(missionId, { windowMode: 101 }, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2100
     * @tc.name: Multi-parameter moveMissionToFront system interface interception test in the form of promise
     * @tc.desc:  Test the third-party application call moveMissionToFront will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2100', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2100';
      let missionId = 0;
      missionManager.moveMissionToFront(missionId, { windowMode: 101 })
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2200
     * @tc.name: callback form moveMissionsToForeground system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2200', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2200';
      let missionIds = [1, 2, 3];
      missionManager.moveMissionsToForeground(missionIds, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2300
     * @tc.name: promise form moveMissionsToForeground system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2300', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2300';
      let missionIds = [1, 2, 3];
      missionManager.moveMissionsToForeground(missionIds)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2400
     * @tc.name: Multi-parameter moveMissionsToForeground system interface interception test in the form of callback
     * @tc.desc:  Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2400', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2400';
      let missionIds = [1, 2, 3];
      let topMission = 2;
      missionManager.moveMissionsToForeground(missionIds, topMission, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2500
     * @tc.name: Multi-parameter moveMissionsToForeground system interface interception test in the form of promise
     * @tc.desc:  Test the third-party application call moveMissionsToForeground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2500', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2500';
      let missionIds = [1, 2, 3];
      let topMission = 2;
      missionManager.moveMissionsToForeground(missionIds, topMission)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2600
     * @tc.name: callback form moveMissionsToBackground system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionsToBackground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2600', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2600';
      let missionIds = [1, 2, 3];
      missionManager.moveMissionsToBackground(missionIds, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Mission_Manager_2700
     * @tc.name: promise form moveMissionsToBackground system interface interception test
     * @tc.desc:  Test the third-party application call moveMissionsToBackground will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Mission_Manager_2700', 0, function (done) {
      let TAG = 'System_API_Test_Mission_Manager_2700';
      let missionIds = [1, 2, 3];
      missionManager.moveMissionsToBackground(missionIds)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })
  })
}