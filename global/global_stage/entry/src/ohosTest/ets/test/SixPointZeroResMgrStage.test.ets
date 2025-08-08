import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { GlobalContext } from '../test/global';

export default function SixPointZeroResMgrStageTest() {
  describe("SixPointZeroResMgrStageTest", () => {
    console.log('*************start SixPointZeroResMgrStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number   : SUB_GLOBAL_ResourceManager_getSysResourceManager_0100
     * @tc.name     : resourceManager_test_getSysResourceManager_0100
     * @tc.desc     : getSysResourceManager
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('resourceManager_test_getSysResourceManager_0100', Level.LEVEL0, () => {
      let value = resourceManager.getSysResourceManager();
      console.log('resourceManager_test_getSysResourceManager_0100:' + value);
      expect(value != null).assertTrue();
    })


  })
}