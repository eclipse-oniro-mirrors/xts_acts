### 0604、0603模板之前迁移上库工程

#### 1、 老版本hyium文件删除

![输入图片说明](/figures/images1.2/24F7CCCC-43EC-4C6C-8AC7-D681D964549B.png)

#### 2、 在自己工程如下图位置添加hypium

hypium获取地址：https://gitcode.com/openharmony/xts_tools/tree/OpenHarmony_feature_20250328/hypium_static

![输入图片说明](/figures/images1.2/486C9F38-21EA-48D4-DD80-B537D39265B2.png)

#### 3、 修改整个工程中用例hypium引用

![输入图片说明](/figures/images1.2/B6CA017C-A249-40EC-8958-A7C1530A02B4.png)

#### 4、 ohostest中的测试用例迁移到main/src文件夹下，然后删除掉ohostest，如果main下没有src，则可以手动创建

![xts代码图片](/figures/images1.2/21374103-0610-45CD-9F03-15094602BEB7.png)