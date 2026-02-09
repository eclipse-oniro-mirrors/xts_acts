### 注意事项

#### 1 上库工程迁移

0528模板前工程迁移，网址：https://gitcode.com/openharmony/xts_acts/tree/OpenHarmony_feature_20250328/README_migrate0528.md

0603，0604模板前工程迁移，网址：https://gitcode.com/openharmony/xts_acts/tree/OpenHarmony_feature_20250328/README_migrate0604.md

#### 2 hypium文件夹，本地验证时需下载存放，上库时需要将hypium文件夹删除掉

#### 3 工程中使用syscap.json，需要将module.json5中红圈改成如图所示

![输入图片说明](/figures/images1.2/8990023F-CB7E-4661-B9EA-E582A0242D5A.png)

#### 4 工程中使用app.json5中的bundleName字段不能使用com.example.helloworld，bundleName位置如下图

![输入图片说明](/figures/images1.2/5C1C0DA1-3208-4CD5-B31D-D52A40E618D0.png)

#### 5 目录命名

注意事项下图所示:(3)既是工程目录名，其中（1）（2）属于子系统名和组件名，不能修改

![输入图片说明](/figures/images1.2/122733EE-A6A0-4BEF-8C59-F66BAD0739EF.png)

|arkts类型|示例1|示例2|示例3|
|-|-|-|-|
|1.1|ActsAmsUsersThirdTest|ace_web_page_saving_dev_three|actscreatemodulecontexttest|
|1.2|ActsAmsUsersThirdTest[***Static***]()|ace_web_page_saving_dev_three_[***static***]()|actscreatemodulecontexttest[***static***]()|
|互操作|ActsAmsUsersThirdTest[***Interop***]()|ace_web_page_saving_dev_three_[***interop***]()|actscreatemodulecontexttest[***interop***]()|

#### 7 bundlename命名

![输入图片说明](/figures/images1.2/5C1C0DA1-3208-4CD5-B31D-D52A40E618D0.png)

|arkts类型|示例|
|-|-|
|1.1|com.open.harmony.actsacewebpagesavtest|
|1.2|com.open.harmony.actsacewebpagesavtest.[***static***]()|
|互操作|com.open.harmony.actsacewebpagesavtest.[***interop***]()|

#### 8 hap_name/targetname/ohos_js_app_static_suite("目标名")命名

![输入图片说明](/figures/images1.2/40A6E21A-582A-4E7F-8AC8-14CB35B1F15B.png)

> 注意：因CodeCheck使用Acts.*Test校验hap_name，所以static不能附加在尾部，否则会被门禁拦截


|arkts类型|示例|
|-|-|
|1.1|ActsFaMyApplication1Test|
|1.2|ActsFaMyApplication1[***Static***]()Test|
|互操作|ActsFaMyApplication1[***Interop***]()Test|

#### 9 用例名命名

![用例名图片](/figures/images1.2/778404BE-B5B2-4D1C-D9AF-29255DFE7542.png)

|arkts类型|示例|
|-|-|
|1.1|abilityConstant_WindowMode_static_0100|
|1.2|abilityConstant_WindowMode_static_[***static***]()_0100|
|1.2|abilityConstant_WindowMode_static_[***interop***]()_0100|

#### 10 由于当前ohosTest不可用，故BUILD.gn文件中test_hap字段需注释

![test_hap图](/figures/images1.2/6EC0A8B3-1ADD-4613-CA9F-17A8CFD89397.png)

#### 11 BUILD.gn必须使用1.2模板名ohos_js_app_static_suite，否则编译环境是1.1

![输入图片说明](/figures/images1.2/91B25DE1-5955-4851-B84E-3E20F8F5B429.png)

注意：part_name = "自己子系统组件名"
     subsystem_name = "自己子系统名"

#### 12 Test.json中的"module-name"字段当前必须写成 entry 

![module_name图](/figures/images1.2/AC2489E4-1156-43FC-ED74-0FD9D65AADF7.png)

#### 13 Test.json中的"test-file-name" 需要和BUILD.gn中的hap_name名字相同

![test_file_name图](/figures/images1.2/C04F87D7-BB2C-4BE9-815F-84C9C925EEF3.png)

![hap_name2图](/figures/images1.2/E5F26AE2-57F1-437E-A605-C1FD2AD39CF9.png)

