import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import asset from '@ohos.security.asset';
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';
import * as aw from './aw/AssetAw';

function StringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}

export default function AssetErrorCodeTest() {
  describe('AssetErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await aw.cleanData();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_JS_wraptype_0100
     * @tc.name test wraptype
     * @tc.desc 数据库允许导出字段测试
     * @tc.size MediumTest
     * @tc.level Level0
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_JS_wraptype_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd1'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label1'));
      attr.set(asset.Tag.WRAP_TYPE, asset.WrapType.TRUSTED_ACCOUNT);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_JS_wraptype_0100 added successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_JS_wraptype_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_JS_wraptype_0200
     * @tc.name test wraptype
     * @tc.desc 数据库不允许导出字段测试
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_JS_wraptype_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label'));
      attr.set(asset.Tag.WRAP_TYPE, asset.WrapType.NEVER);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_JS_wraptype_0200 added successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_JS_wraptype_0200 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100
     * @tc.name test add
     * @tc.desc 存在同名资产时新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd2'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label2'));
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 added first successfully`);
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 added Second successfully`);
        expect(null).assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000003);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_add_401_0100
     * @tc.name test add
     * @tc.desc 参数异常时新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_add_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_401_0100 added  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_add_401_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100
     * @tc.name test postQuerySync
     * @tc.desc 参数异常时使用postQuerySync接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        asset.postQuerySync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100 postQuerySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100 Failed to postQuerySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100
     * @tc.name test postQuery
     * @tc.desc 参数异常时使用postQuery接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        asset.postQuery(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100 postQuerySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100 Failed to postQuerySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100
     * @tc.name test removeSync
     * @tc.desc 调用removeSync接口，删除不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.removeSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100 removeSync successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100 Failed to remove Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100
     * @tc.name test remove
     * @tc.desc 调用remove接口，删除不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.remove(attr).then(() => {
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Asset removed successfully.`);
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Failed to remove1 Asset. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(24000002);
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Failed to remove2 Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100
     * @tc.name test preQuerySync
     * @tc.desc 反复调用preQuerySync接口，不释放缓存返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let challenge = new Uint8Array ([]);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      let attr2: asset.AssetMap = new Map();
      try {
        for (let index=0; index < 20; index++) {
          challenge = asset.preQuerySync(attr2);
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100 Asset preQuerySync SUCCESS. `)
        };
        expect(null).assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000016);
      }
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.AUTH_CHALLENGE, challenge);
      await asset.postQuery(attr3);
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100
     * @tc.name test preQuerySync
     * @tc.desc 调用preQuerySync接口，查询不支持的功能，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr2.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr2.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr2.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      await asset.add(attr2);
      let attr3: asset.AssetMap = new Map();
      try {
        asset.preQuerySync(attr3);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100 Asset preQuery SUCCESS. `);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000017);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100
     * @tc.name test preQuerySync
     * @tc.desc 调用preQuerySync接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, StringToArray('00000000000'));
      try {
        asset.preQuerySync(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100 Asset preQuerySync SUCCESS. `);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100
     * @tc.name test preQuery
     * @tc.desc 调用preQuery接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.preQuery(attr2).then((challenge: Uint8Array) => {
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Asset preQuery SUCCESS. `);
        }).catch ((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Failed to pre-query1 Asset. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(24000002);
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Failed to pre-query2 Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuery_016_0100
     * @tc.name test preQuery
     * @tc.desc 反复调用preQuery接口，不释放缓存返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuery_016_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let challenge = new Uint8Array ([]);
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      try {
        for (let index=0; index < 20; index++) {
          challenge = await asset.preQuery(attr2);
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_016_0100 Asset preQuery SUCCESS. `);
        };
        expect(null).assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_016_0100 Failed to pre-query2 Asset. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(24000016);
      }
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.AUTH_CHALLENGE, challenge);
      await asset.postQuery(attr3);
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_addSync_03_0100
     * @tc.name test addSync
     * @tc.desc 存在同名资产时新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_addSync_03_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('tag1'));
      try {
        asset.addSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_addSync_03_0100 addsync first successfully`);
        asset.addSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_addSync_03_0100 addsync Second successfully`);
        expect(null).assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_addSync_03_0100 Failed to addSync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000003);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_addSync_401_0100
     * @tc.name test addSync
     * @tc.desc 参数异常时使用addSync接口新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_addSync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        asset.addSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_addSync_401_0100 addSync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_addSync_401_0100 Failed to addSync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100
     * @tc.name test preQuery
     * @tc.desc 调用preQuery接口，查询不支持的功能，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('12345678'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr1.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr1.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr2: asset.AssetMap = new Map();
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100 added first SUCCESS Asset.`);
        await asset.add(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100 added SECOND SUCCESS Asset.`);
        await asset.preQuery(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100 Succeeded in pre-querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_017_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000017);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100
     * @tc.name test querySync
     * @tc.desc 调用querySync接口，批量查询关键资产明文，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('12345678'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr1.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr1.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100 added first SUCCESS Asset.`);
        await asset.add(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100 added SECOND SUCCESS Asset.`);
        asset.querySync(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_querySync_017_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000017);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_querySync_02_0100
     * @tc.name test querySync
     * @tc.desc 调用querySync接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_querySync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.querySync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_02_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_querySync_02_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100
     * @tc.name test querySync
     * @tc.desc 验证身份失败，调用querySync接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('12345678'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100 Succeeded in add Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      let challenge = await asset.preQuery(attr1) as Uint8Array;
      let attr2: asset.AssetMap = new Map();
      let auth_token  = new Uint8Array ([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
      attr2.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr2.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      attr2.set(asset.Tag.AUTH_TOKEN, auth_token);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      attr2.set(asset.Tag.AUTH_CHALLENGE, challenge);
      try {
        asset.querySync(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_querySync_04_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000004);
      }
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.AUTH_CHALLENGE, challenge);
      await asset.postQuery(attr3);
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_query_017_0100
     * @tc.name test query
     * @tc.desc 调用query接口，批量查询关键资产明文，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_query_017_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('12345678'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr1.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr1.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_017_0100 added first SUCCESS Asset.`);
        await asset.add(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_017_0100 added SECOND SUCCESS Asset.`);
        await asset.query(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_017_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_query_017_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000017);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_query_02_0100
     * @tc.name test query
     * @tc.desc 调用query接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_query_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        await asset.query(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_02_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_query_02_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_query_04_0100
     * @tc.name test query
     * @tc.desc 验证身份失败，调用query接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_query_04_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('12345678'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_04_0100 Succeeded in add Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_query_04_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      let challenge = await asset.preQuery(attr1) as Uint8Array;
      let attr2: asset.AssetMap = new Map();
      let auth_token  = new Uint8Array ([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
      attr2.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr2.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      attr2.set(asset.Tag.AUTH_TOKEN, auth_token);
      attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      attr2.set(asset.Tag.AUTH_CHALLENGE, challenge);
      try {
        await asset.query(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_04_0100 Succeeded in querying Asset.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_query_04_0100 Failed to querying Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000004);
      }
      let attr3: asset.AssetMap = new Map();
      attr3.set(asset.Tag.AUTH_CHALLENGE, challenge);
      await asset.postQuery(attr3);
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_updateSync_02_0100
     * @tc.name test updateSync
     * @tc.desc 调用updateSync接口，修改不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_updateSync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('demo_pwd_new'));
      try {
          asset.updateSync(attr, attr1);
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_updateSync_02_0100 Asset updated successfully.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_updateSync_02_0100 Failed to update Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_update_02_0100
     * @tc.name test update
     * @tc.desc 调用updateSync接口，修改不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_update_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('demo_pwd_new'));
      try {
        await asset.update(attr, attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_update_02_0100 Asset updated successfully.`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_update_02_0100 Failed to update Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_addSync_201_0100
     * @tc.name test addSync
     * @tc.desc 没有权限时使用addSync接口新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_addSync_201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr.set(asset.Tag.IS_PERSISTENT, true);
      try {
        asset.addSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_addSync_201_0100 addSync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_addSync_201_0100 Failed to addSync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_add_201_0100
     * @tc.name test add
     * @tc.desc 没有权限时使用add接口新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_add_201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr.set(asset.Tag.IS_PERSISTENT, true);
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_201_0100 add  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_add_201_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_401_0100
     * @tc.name test preQuerySync
     * @tc.desc 参数异常时使用preQuerySync接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        asset.preQuerySync(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_401_0100 postQuerySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_401_0100 Failed to preQuerySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuery_401_0100
     * @tc.name test preQuery
     * @tc.desc 参数异常时使用preQuery接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuery_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        await asset.preQuery(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_401_0100 postQuery  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_401_0100 Failed to preQuery Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_JS_group_0100
     * @tc.name test GROUP_ID
     * @tc.desc 数据库群组字段测试
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_JS_group_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias3'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label3'));
      attr.set(asset.Tag.GROUP_ID, StringToArray('assetGroup'));
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_JS_group_0100 added successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_JS_group_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000010);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_querySync_401_0100
     * @tc.name test querySync
     * @tc.desc 参数异常时使用querySync接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_querySync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        asset.querySync(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_querySync_401_0100 querySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_querySync_401_0100 Failed to querySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_query_401_0100
     * @tc.name test query
     * @tc.desc 参数异常时使用query接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_query_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        await asset.query(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_query_401_0100 query  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_query_401_0100 Failed to query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_removeSync_401_0100
     * @tc.name test removeSync
     * @tc.desc 参数异常时使用removeSync接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_removeSync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        asset.removeSync(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_401_0100 removeSync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_401_0100 Failed to removeSync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_remove_401_0100
     * @tc.name test remove
     * @tc.desc 参数异常时使用remove接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_remove_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.ALIAS, 1);
      try {
        await asset.remove(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_remove_401_0100 remove  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_remove_401_0100 Failed to remove Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_updateSync_401_0100
     * @tc.name test updateSync
     * @tc.desc 参数异常时使用updateSync接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_updateSync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, 1);
      try {
        asset.updateSync(attr, attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_updateSync_401_0100 updateSync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_updateSync_401_0100 Failed to updateSync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_update_401_0100
     * @tc.name test update
     * @tc.desc 参数异常时使用remove接口查询数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_update_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, 1);
      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('0000000000'));
      try {
        await asset.update(attr, attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_update_401_0100 update  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_update_401_0100 Failed to update Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100
     * @tc.name SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100
     * @tc.desc 普通数据库同步查询
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, false);
      try {
        asset.querySyncResult(attr).then((res: asset.SyncResult) => {
          console.info(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100 sync result is: ${JSON.stringify(res)}`);
          expect(res.resultCode).assertEqual(0);
          expect(res.totalCount).assertEqual(0);
          expect(res.failedCount).assertEqual(0);
        }).catch ((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0100 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101
     * @tc.name SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101
     * @tc.desc 加密数据库同步查询
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
      try {
        asset.querySyncResult(attr).then((res: asset.SyncResult) => {
          console.info(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101 sync result is: ${JSON.stringify(res)}`);
          expect(res.resultCode).assertEqual(0);
          expect(res.totalCount).assertEqual(0);
          expect(res.failedCount).assertEqual(0);
        }).catch ((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0101 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102
     * @tc.name SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102
     * @tc.desc 不传REQUIRE_ATTR_ENCRYPTED
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      try {
        asset.querySyncResult(attr).then((res: asset.SyncResult) => {
          console.info(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102 sync result is: ${JSON.stringify(res)}`);
          expect(res.resultCode).assertEqual(0);
          expect(res.totalCount).assertEqual(0);
          expect(res.failedCount).assertEqual(0);
        }).catch ((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0102 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_querySyncResult_Func_0103
     * @tc.name SUB_Security_DataSecurity_Asset_querySyncResult_Func_0103
     * @tc.desc 传入错误的alias，返回对应错误码
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_querySyncResult_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_code'));
      try {
        await asset.querySyncResult(attr);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_querySyncResult_Func_0103 Failed to query sync result of Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(asset.ErrorCode.PARAM_VERIFICATION_FAILED);
      }
      done();
    });
  })
}