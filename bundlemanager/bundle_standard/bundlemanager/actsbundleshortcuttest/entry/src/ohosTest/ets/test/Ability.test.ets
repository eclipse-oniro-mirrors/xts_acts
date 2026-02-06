import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {  shortcutManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function localUnitTest() {
  const DOMAIN: number = 0x0000;

  describe('localUnitTest', () => {
    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_001
     * @tc.number Sub_Bms_Framework_shortcutManager_001
     * @tc.desc   Obtain the shortcut config data through the get interface to determine if it is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        let tag = 'Sub_Bms_Framework_shortcutManager_001';
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
        const data = await shortcutManager.getAllShortcutInfoForSelf()
        hilog.info(DOMAIN, 'getAllShortcutInfoForSelfData:', JSON.stringify(data));
        const expectedValues : shortcutManager.ShortcutInfo = {
          id: 'id_test',
          bundleName: 'com.example.shortcuttest',
          moduleName: 'entry_test',
          hostAbility: '',
          icon: '',
          iconId: 0,
          label: "",
          labelId: 0,
          appIndex: 0,
          sourceType: 1,
          visible: true,
        };
        const idArray : string[] = [
          'shortcut_id',
          'id_test1',
          'id_test2',
          'id_test3',
          'id_test4_test',
        ]
        data.forEach((item, index) => {
          if (item) {
            expect(item.id).assertEqual(idArray[index]);
            expect(item.bundleName).assertEqual(expectedValues.bundleName);
            expect(item.moduleName).assertEqual(expectedValues.moduleName);
            expect(item.hostAbility).assertEqual(expectedValues.hostAbility);
            expect(item.icon).assertEqual(expectedValues.icon);
            expect(item.iconId).assertEqual(expectedValues.iconId);
            expect(item.label).assertEqual(expectedValues.label);
            expect(item.labelId).assertEqual(expectedValues.labelId);
            expect(item.appIndex).assertEqual(expectedValues.appIndex);
            expect(item.sourceType).assertEqual(expectedValues.sourceType);
            expect(item.visible).assertEqual(index !== 2 && index !== 3);
            expect(item.wants?.length).assertEqual(1);

            if (item.wants?.length) {
              expect(item.wants[0].parameters?.length).assertEqual(1);
              expect(item.wants[0].targetBundle).assertEqual(index === 4 ? expectedValues.bundleName + '_test': expectedValues.bundleName);
              expect(item.wants[0].targetModule).assertEqual(index === 4 ? "entry_test" : "entry");
              expect(item.wants[0].targetAbility).assertEqual(index === 4 ? "EntryAbility_test" : "EntryAbility");
              if(item.wants[0].parameters?.length){
                expect(item.wants[0].parameters[0].key).assertEqual("index");
                expect(item.wants[0].parameters[0].value).assertEqual(JSON.stringify(index));
              }
            }
          }
          done();
        })
      }catch(error) {
        hilog.error(DOMAIN,'getAllShortcutInfoForSelfData', JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_002
     * @tc.number Sub_Bms_Framework_shortcutManager_002
     * @tc.desc   Set all visible fields to true through 'set' to check if the query data is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'Sub_Bms_Framework_shortcutManager_002';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      try{
        const data = await shortcutManager.getAllShortcutInfoForSelf();
        data.map((item, index) => {
          expect(item.visible).assertEqual(index !== 2 && index !== 3);
        })
      }catch(error){
        hilog.error(DOMAIN,'setShortcutVisibleTrueData', JSON.stringify(error));
        expect().assertFail();
        done();
      } finally{
        try {
          await shortcutManager.setShortcutVisibleForSelf('shortcut_id', true);
          await shortcutManager.setShortcutVisibleForSelf('id_test1', true);
          await shortcutManager.setShortcutVisibleForSelf('id_test2', true);
          await shortcutManager.setShortcutVisibleForSelf('id_test3', true);
          await shortcutManager.setShortcutVisibleForSelf('id_test4_test', true);
        }catch(error) {
          hilog.error(DOMAIN,'setShortcutVisibleTrueData', JSON.stringify(error));
          expect().assertFail();
          done();
        } finally {
          const data = await shortcutManager.getAllShortcutInfoForSelf();
          hilog.info(DOMAIN,'setShortcutVisibleTrueData:', JSON.stringify(data));
          data.map((item) => {
            expect(item.visible).assertTrue();
          })
          done();
        }
      }
    })
    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_003
     * @tc.number Sub_Bms_Framework_shortcutManager_003
     * @tc.desc   Set all visible fields to false through 'set' to check if the data is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'Sub_Bms_Framework_shortcutManager_003';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      try{
        const data = await shortcutManager.getAllShortcutInfoForSelf();
        data.map((item) => {
          expect(item.visible).assertTrue();
        })
      }catch(error){
        hilog.error(DOMAIN,'setShortcutVisibleTrueData', JSON.stringify(error));
        expect().assertFail();
        done();
      } finally{
        try{
          await shortcutManager.setShortcutVisibleForSelf('shortcut_id', false);
          await shortcutManager.setShortcutVisibleForSelf('id_test1', false);
          await shortcutManager.setShortcutVisibleForSelf('id_test2', false);
          await shortcutManager.setShortcutVisibleForSelf('id_test3', false);
          await shortcutManager.setShortcutVisibleForSelf('id_test4_test', false);
        }catch(error) {
          hilog.error(DOMAIN,'setShortcutVisibleFalseData', JSON.stringify(error));
          expect().assertFail();
          done();
        } finally {
        setTimeout(async () => {
          const data = await shortcutManager.getAllShortcutInfoForSelf();
          hilog.info(DOMAIN,'setShortcutVisibleFalseData:', JSON.stringify(data));
          data.map((item) => {
            expect(item.visible).assertFalse();
          })
          done();
        },1000)
        }
      }
    })
    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_004
     * @tc.number Sub_Bms_Framework_shortcutManager_004
     * @tc.desc   setShortcutVisibleForSelf 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'Sub_Bms_Framework_shortcutManager_004';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      try{
        await shortcutManager.setShortcutVisibleForSelf(undefined, false);
        expect().assertFail();
      }catch(error) {
        let code = (error as BusinessError).code;
        expect(code).assertEqual(401);
        hilog.error(DOMAIN,'setShortcutVisibleFalseData', JSON.stringify(error))
        done();
      }
    })
    /**
     * @tc.name   Sub_Bms_Framework_shortcutManager_005
     * @tc.number Sub_Bms_Framework_shortcutManager_005
     * @tc.desc   setShortcutVisibleForSelf 17700070.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_shortcutManager_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'Sub_Bms_Framework_shortcutManager_005';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      try{
        await shortcutManager.setShortcutVisibleForSelf('shortcut_id_Error', false);
        expect().assertFail();
      }catch(error) {
        let code = (error as BusinessError).code;
        expect(code).assertEqual(17700070);
        hilog.error(DOMAIN,'setShortcutVisibleFalseData', JSON.stringify(error))
        done();
      }
    })
  });
}