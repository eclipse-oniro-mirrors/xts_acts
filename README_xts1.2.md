## 0328分支xts工程上库流程

### 1、上库工程组成

上库模板工程代码： https://gitcode.com/openharmony/xts_acts/tree/OpenHarmony_feature_20250328/ability/ability_runtime/ActsAbility2StaticTest

xts工程组成，如下图

![输入图片说明](/figures/images1.2/1CB1D84C-E100-4747-86CD-5F43119FC0BD.png)

##### 1.1 如上图（1）中hypium文件夹处存放hypium代码

hypium获取地址：https://gitcode.com/openharmony/xts_tools/tree/OpenHarmony_feature_20250328/hypium_static

注意事项：hypium本地验证时需要下载放在此处，上库时需要将hypium文件夹删除掉

##### 1.2 如上图 (2) 中的src文件，存放的时xts用例代码

##### 1.3 如上图 (3) 中的syscap.json文件，存放当前测试用例接口最小syscap

示例：测试@ohos.app.ability.Want.d.ets文件中Want类的bundleName属性，则只需引入SystemCapability.Ability.AbilityBase，如下图

![输入图片说明](/figures/images1.2/99011790-D7AD-4CBF-8557-576CDCC3D298.png)

##### 1.4 如上图 (4) 中的signature文件，存放.p7b文件

签名网址：https://gitcode.com/openharmony/xts_acts/wikis/XTS%E7%AD%BE%E5%90%8D/%E7%AD%BE%E5%90%8D%E5%B7%A5%E5%85%B7%E8%8E%B7%E5%8F%96%E6%96%B9%E5%BC%8F

##### 1.5 如上图 (5) 中的BUIGD.gn文件，可以按照整改的xts1.1数据填写，（需要看注意事项）

##### 1.6 如上图 (6) 中的Test.json文件，可以按照整改的xts1.1数据填写，（需要看注意事项）

### 2、注意事项，非常重要，一定要看

注意事项：
https://gitcode.com/openharmony/xts_acts/tree/OpenHarmony_feature_20250328/README_note.md