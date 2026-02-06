# XTS子系统<a name="ZH-CN_TOPIC_0000001117409671"></a>

-   [简介](#section465982318513)
-   [系统类型](#section125090457443)
-   [目录](#section161941989596)
-   [约束](#section119744591305)
-   [使用说明](#section137768191623)
-   [用例开发指导](#section3695134065513)
    -   [C语言用例开发编译指导（适用于轻量系统产品用例开发）](#section198193336544)
    -   [C语言用例执行指导（适用于轻量系统产品用例开发）](#section13820233175418)
    -   [C++语言用例开发编译指导（适用于小型系统、标准系统用例开发）](#section3822123311540)
    -   [C++语言用例执行指导（适用于小型系统、标准系统用例开发）](#section128222336544)
    -   [JS语言用例开发指导（适用于标准系统）](#section159801435165220)
    -   [JS语言用例编译打包指导（适用于标准系统）](#section445519106559)
    -   [Python用例开发编译指导](#section281040146993)
    -   [Python用例执行指导](#section637497153319)

-   [相关仓](#section1371113476307)

## 简介<a name="section465982318513"></a>

XTS子系统是OpenHarmony生态认证测试套件的集合，当前包括ACTS（application compatibility test suite）应用兼容性测试组件，后续将拓展DCTS（distributed compatibility test suite）分布式兼容性测试组件、HATS（hardware abstract test suite) 硬件抽象层兼容性测试组件。

XTS子系统当前包括ACTS 与Tools 软件包：

-   ACTS，存放ACTS 相关测试案例源码与配置文件，其目的是帮助终端设备制造商尽早发现软件与OpenHarmony的不兼容问题，确保软件在整个开发周期内符合OpenHarmony的兼容性标准。
-   Tools，存放ACTS 相关测试案例开发框架。

## 系统类型<a name="section125090457443"></a>

OpenHarmony支持如下几种系统类型：

-   轻量系统（mini system）

    面向MCU类处理器例如Arm Cortex-M、RISC-V 32位的设备，硬件资源极其有限，支持的设备最小内存为128KiB，可以提供多种轻量级网络协议，轻量级的图形框架，以及丰富的IOT总线读写部件等。可支撑的产品如智能家居领域的连接类模组、传感器设备、穿戴类设备等。

-   小型系统（small system）

    面向应用处理器例如Arm Cortex-A的设备，支持的设备最小内存为1MiB，可以提供更高的安全能力、标准的图形框架、视频编解码的多媒体能力。可支撑的产品如智能家居领域的IP Camera、电子猫眼、路由器以及智慧出行领域的行车记录仪等。

-   标准系统（standard system）

    面向应用处理器例如Arm Cortex-A的设备，支持的设备最小内存为128MiB，可以提供增强的交互能力、3D GPU以及硬件合成能力、更多控件以及动画效果更丰富的图形能力、完整的应用框架。可支撑的产品如高端的冰箱显示屏。


## 目录<a name="section161941989596"></a>

```
/test/xts
├── acts                # 测试代码存放目录
│   └── subsystem       # 标准系统子系统测试用例源码存放目录
│   └── subsystem_lite  # 轻量系统、小型系统子系统测试用例源码存放目录
│   └── BUILD.gn        # 标准系统测试用例编译配置
│   └── build_lite      # 轻量系统、小型系统测试用例编译配置存放目录
│       └── BUILD.gn    # 轻量系统、小型系统测试用例编译配置
└── tools               # 测试工具代码存放目录
```

## 约束<a name="section119744591305"></a>

轻量系统用例开发语言是C，小型系统用例开发语言是C++。

## 使用说明<a name="section137768191623"></a>

**表 1**  用例级别说明

<a name="table12856113719456"></a>
<table><thead align="left"><tr id="row88561737114517"><th class="cellrowborder" valign="top" width="33.333333333333336%" id="mcps1.2.4.1.1"><p id="p54711456452"><a name="p54711456452"></a><a name="p54711456452"></a>级别名称</p>
</th>
<th class="cellrowborder" valign="top" width="33.283328332833285%" id="mcps1.2.4.1.2"><p id="p114834544518"><a name="p114834544518"></a><a name="p114834544518"></a>基本定义</p>
</th>
<th class="cellrowborder" valign="top" width="33.383338333833386%" id="mcps1.2.4.1.3"><p id="p348154574518"><a name="p348154574518"></a><a name="p348154574518"></a>测试范围</p>
</th>
</tr>
</thead>
<tbody><tr id="row78561137134514"><td class="cellrowborder" valign="top" width="33.333333333333336%" headers="mcps1.2.4.1.1 "><p id="p17481345124512"><a name="p17481345124512"></a><a name="p17481345124512"></a>Level0</p>
</td>
<td class="cellrowborder" valign="top" width="33.283328332833285%" headers="mcps1.2.4.1.2 "><p id="p1548945204514"><a name="p1548945204514"></a><a name="p1548945204514"></a>冒烟</p>
</td>
<td class="cellrowborder" valign="top" width="33.383338333833386%" headers="mcps1.2.4.1.3 "><p id="p174824517456"><a name="p174824517456"></a><a name="p174824517456"></a>验证关键功能点基本功能/最基本DFX属性在最常见输入下的表现，通过表示功能基本可运行。</p>
</td>
</tr>
<tr id="row28563372451"><td class="cellrowborder" valign="top" width="33.333333333333336%" headers="mcps1.2.4.1.1 "><p id="p448445144512"><a name="p448445144512"></a><a name="p448445144512"></a>Level1</p>
</td>
<td class="cellrowborder" valign="top" width="33.283328332833285%" headers="mcps1.2.4.1.2 "><p id="p44813452452"><a name="p44813452452"></a><a name="p44813452452"></a>基本</p>
</td>
<td class="cellrowborder" valign="top" width="33.383338333833386%" headers="mcps1.2.4.1.3 "><p id="p648184584514"><a name="p648184584514"></a><a name="p648184584514"></a>验证各功能点基本功能/基本DFX属性在常见输入下的表现，通过表示功能基本可测试。</p>
</td>
</tr>
<tr id="row12856137204514"><td class="cellrowborder" valign="top" width="33.333333333333336%" headers="mcps1.2.4.1.1 "><p id="p164834520453"><a name="p164834520453"></a><a name="p164834520453"></a>Level2</p>
</td>
<td class="cellrowborder" valign="top" width="33.283328332833285%" headers="mcps1.2.4.1.2 "><p id="p148245184511"><a name="p148245184511"></a><a name="p148245184511"></a>重要</p>
</td>
<td class="cellrowborder" valign="top" width="33.383338333833386%" headers="mcps1.2.4.1.3 "><p id="p348945124510"><a name="p348945124510"></a><a name="p348945124510"></a>验证各功能点的基本功能/基本DFX属性在常规输入/常见异常情况下的表现，通过表示功能基本正常可用，可开展Beta。</p>
</td>
</tr>
<tr id="row48571137204514"><td class="cellrowborder" valign="top" width="33.333333333333336%" headers="mcps1.2.4.1.1 "><p id="p7481545184513"><a name="p7481545184513"></a><a name="p7481545184513"></a>Level3</p>
</td>
<td class="cellrowborder" valign="top" width="33.283328332833285%" headers="mcps1.2.4.1.2 "><p id="p1748184514455"><a name="p1748184514455"></a><a name="p1748184514455"></a>一般</p>
</td>
<td class="cellrowborder" valign="top" width="33.383338333833386%" headers="mcps1.2.4.1.3 "><p id="p8481245104519"><a name="p8481245104519"></a><a name="p8481245104519"></a>验证各功能点的全部功能/全部DFX属性在各种常规/非常规输入组合下，或各种正常/异常预置条件组合下的表现。</p>
</td>
</tr>
<tr id="row14857133712451"><td class="cellrowborder" valign="top" width="33.333333333333336%" headers="mcps1.2.4.1.1 "><p id="p1248144515456"><a name="p1248144515456"></a><a name="p1248144515456"></a>Level4</p>
</td>
<td class="cellrowborder" valign="top" width="33.283328332833285%" headers="mcps1.2.4.1.2 "><p id="p94804514519"><a name="p94804514519"></a><a name="p94804514519"></a>生僻</p>
</td>
<td class="cellrowborder" valign="top" width="33.383338333833386%" headers="mcps1.2.4.1.3 "><p id="p1248445164516"><a name="p1248445164516"></a><a name="p1248445164516"></a>验证关键功能点在极端异常预置条件下、用户难以触及的异常输入组合下的表现。</p>
</td>
</tr>
</tbody>
</table>

**表 2**  用例粒度说明

<a name="table1690733521014"></a>
<table><thead align="left"><tr id="row9907143516105"><th class="cellrowborder" valign="top" width="19.591959195919593%" id="mcps1.2.4.1.1"><p id="p1141312416102"><a name="p1141312416102"></a><a name="p1141312416102"></a>用例规模</p>
</th>
<th class="cellrowborder" valign="top" width="35.17351735173517%" id="mcps1.2.4.1.2"><p id="p34131416109"><a name="p34131416109"></a><a name="p34131416109"></a>被测试对象</p>
</th>
<th class="cellrowborder" valign="top" width="45.23452345234523%" id="mcps1.2.4.1.3"><p id="p12413141171010"><a name="p12413141171010"></a><a name="p12413141171010"></a>测试环境</p>
</th>
</tr>
</thead>
<tbody><tr id="row2907335181017"><td class="cellrowborder" valign="top" width="19.591959195919593%" headers="mcps1.2.4.1.1 "><p id="p6414134117109"><a name="p6414134117109"></a><a name="p6414134117109"></a>LargeTest</p>
</td>
<td class="cellrowborder" valign="top" width="35.17351735173517%" headers="mcps1.2.4.1.2 "><p id="p20414104113101"><a name="p20414104113101"></a><a name="p20414104113101"></a>业务功能/全场景特性/整机及场景级DFX</p>
</td>
<td class="cellrowborder" valign="top" width="45.23452345234523%" headers="mcps1.2.4.1.3 "><p id="p5414841121013"><a name="p5414841121013"></a><a name="p5414841121013"></a>尽量使用贴近真实的环境设备</p>
</td>
</tr>
<tr id="row10907635131015"><td class="cellrowborder" valign="top" width="19.591959195919593%" headers="mcps1.2.4.1.1 "><p id="p19414134117104"><a name="p19414134117104"></a><a name="p19414134117104"></a>MediumTest</p>
</td>
<td class="cellrowborder" valign="top" width="35.17351735173517%" headers="mcps1.2.4.1.2 "><p id="p114141241141018"><a name="p114141241141018"></a><a name="p114141241141018"></a>模块/子系统集成至设备后的功能/DFX</p>
</td>
<td class="cellrowborder" valign="top" width="45.23452345234523%" headers="mcps1.2.4.1.3 "><p id="p14414941111015"><a name="p14414941111015"></a><a name="p14414941111015"></a>使用真实的单设备进行验证，可进行消息模拟，尽量不对函数进行MOCK</p>
</td>
</tr>
<tr id="row1990713353100"><td class="cellrowborder" valign="top" width="19.591959195919593%" headers="mcps1.2.4.1.1 "><p id="p641414110109"><a name="p641414110109"></a><a name="p641414110109"></a>SmallTest</p>
</td>
<td class="cellrowborder" valign="top" width="35.17351735173517%" headers="mcps1.2.4.1.2 "><p id="p54141541181018"><a name="p54141541181018"></a><a name="p54141541181018"></a>模块/类/函数</p>
</td>
<td class="cellrowborder" valign="top" width="45.23452345234523%" headers="mcps1.2.4.1.3 "><p id="p1841494131013"><a name="p1841494131013"></a><a name="p1841494131013"></a>在开发者个人环境进行测试，尽量不依赖其他模块，存在大量的MOCK</p>
</td>
</tr>
</tbody>
</table>

**表 3**  测试类型说明

<a name="table18811230124619"></a>
<table><thead align="left"><tr id="row48163019466"><th class="cellrowborder" valign="top" width="19.040000000000003%" id="mcps1.2.3.1.1"><p id="p1791784418465"><a name="p1791784418465"></a><a name="p1791784418465"></a>测试类型名称</p>
</th>
<th class="cellrowborder" valign="top" width="80.96%" id="mcps1.2.3.1.2"><p id="p2917164444614"><a name="p2917164444614"></a><a name="p2917164444614"></a>测试类型定义</p>
</th>
</tr>
</thead>
<tbody><tr id="row682630104615"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p1091784414469"><a name="p1091784414469"></a><a name="p1091784414469"></a>Function</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p16917344104618"><a name="p16917344104618"></a><a name="p16917344104618"></a>验证被测对象提供给用户的业务功能实现正确性的测试项，这里的“用户”可以是终端用户或开发者，功能包括业务功能及平台功能</p>
</td>
</tr>
<tr id="row1821930154611"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p591714474612"><a name="p591714474612"></a><a name="p591714474612"></a>Performance</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p15917154410463"><a name="p15917154410463"></a><a name="p15917154410463"></a>验证被测对象在特定预置条件/负载模型下的处理能力的测试项，“处理能力”一般以单位时间内可处理的业务量来衡量，如呼叫/秒，帧率/秒，事件处理量/秒等</p>
</td>
</tr>
<tr id="row13821030104616"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p691711440467"><a name="p691711440467"></a><a name="p691711440467"></a>Power</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p159171544104616"><a name="p159171544104616"></a><a name="p159171544104616"></a>验证被测对象在特定预置条件/负载模型下在一定时间内能源消耗量的测试项</p>
</td>
</tr>
<tr id="row6821330114618"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p13917164454612"><a name="p13917164454612"></a><a name="p13917164454612"></a>Reliability</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p11917194416465"><a name="p11917194416465"></a><a name="p11917194416465"></a>验证被测对象在正常/异常输入情况下，或业务量压力和长时间连续运行压力情况下业务表现的测试项，含稳定性、压力、故障注入、Monkey测试项</p>
</td>
</tr>
<tr id="row11821930184612"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p1691774474618"><a name="p1691774474618"></a><a name="p1691774474618"></a>Security</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p1791784410463"><a name="p1791784410463"></a><a name="p1791784410463"></a>验证系统对恶意威胁的防护能力，威胁包括但不限于未授权访问、使用、泄露、破坏、修改、毁灭，以保障信息的机密性、完整性和可用性; 验证系统对用户隐私的保护能力，保障用户的隐私数据被收集、使用、保有、披露和处置符合法律规范，保障用户的隐私权; 验证对各类安全规范的遵从情况，如安全设计规范、安全红线、工信部安全认证规范等，保障安全相关法律法规的合规。</p>
</td>
</tr>
<tr id="row16825307467"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p129188444462"><a name="p129188444462"></a><a name="p129188444462"></a>Global</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p179186444465"><a name="p179186444465"></a><a name="p179186444465"></a>验证被测对象在是否具有国际化数据支持和本地化能力的测试项，包括语言显示、输入/输出习惯、时间显示、区域特性如货币时间禁忌等等</p>
</td>
</tr>
<tr id="row08211308464"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p191814447465"><a name="p191814447465"></a><a name="p191814447465"></a>Compatibility</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p99181344144613"><a name="p99181344144613"></a><a name="p99181344144613"></a>当被测对象为应用时，包括被测对象对于自身数据的后向兼容性、对于系统的前后向兼容性、对于不同用户数据(如播放器之音频文件格式/智能短信之用户短信内容)的兼容性测试项； 当被测对象为系统时，包括被测系统对于系统自身数据的后向兼容性、以及对于生态中常用应用的兼容性测试项；当被测对象为软件时，包括被测系统对于相关的硬件的兼容性；</p>
</td>
</tr>
<tr id="row1782730124618"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p13918144134614"><a name="p13918144134614"></a><a name="p13918144134614"></a>User</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p1291844494611"><a name="p1291844494611"></a><a name="p1291844494611"></a>验证被测对象在真实用户场景下的用户体验感受的测试项，注意此种情况下没有客观的“正确”与“失败”，所有的结论及评价都应该来自于用户</p>
</td>
</tr>
<tr id="row58243024617"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p1291884474614"><a name="p1291884474614"></a><a name="p1291884474614"></a>Standard</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p0918124424614"><a name="p0918124424614"></a><a name="p0918124424614"></a>验证被测对象对于行业及公司内标准/协议/规范的遵从情况的测试项，注意此处的“标准”不包含任何安全标准，针对安全标准的测试项划归为“安全测试”类型</p>
</td>
</tr>
<tr id="row382830124619"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p119181044164619"><a name="p119181044164619"></a><a name="p119181044164619"></a>Safety</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p1291818443468"><a name="p1291818443468"></a><a name="p1291818443468"></a>验证被测对象的Safety属性，避免产品可能对人身安全、健康以及产品本身带来的危害。</p>
</td>
</tr>
<tr id="row1083153014465"><td class="cellrowborder" valign="top" width="19.040000000000003%" headers="mcps1.2.3.1.1 "><p id="p39187441469"><a name="p39187441469"></a><a name="p39187441469"></a>Resilience</p>
</td>
<td class="cellrowborder" valign="top" width="80.96%" headers="mcps1.2.3.1.2 "><p id="p891815444462"><a name="p891815444462"></a><a name="p891815444462"></a>验证被测对象的韧性属性，确保系统受攻击时承受并保持在有定义的运行状态（包括降级）、恢复并适应攻击以保障Mission达成。</p>
</td>
</tr>
</tbody>
</table>

## 用例开发指导<a name="section3695134065513"></a>

根据测试系统选择测试框架和对应测试用例语言。

**表 4**  系统和测试框架、开发语言对应关系

<a name="table4418343171415"></a>
<table><thead align="left"><tr id="row34183435145"><th class="cellrowborder" valign="top" width="33.33333333333333%" id="mcps1.2.4.1.1"><p id="p941874311148"><a name="p941874311148"></a><a name="p941874311148"></a>系统</p>
</th>
<th class="cellrowborder" valign="top" width="33.33333333333333%" id="mcps1.2.4.1.2"><p id="p1841804341413"><a name="p1841804341413"></a><a name="p1841804341413"></a>测试框架</p>
</th>
<th class="cellrowborder" valign="top" width="33.33333333333333%" id="mcps1.2.4.1.3"><p id="p2418104311148"><a name="p2418104311148"></a><a name="p2418104311148"></a>语言</p>
</th>
</tr>
</thead>
<tbody><tr id="row8419164319148"><td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.1 "><p id="p7419194312143"><a name="p7419194312143"></a><a name="p7419194312143"></a>轻量系统</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.2 "><p id="p10419124312145"><a name="p10419124312145"></a><a name="p10419124312145"></a>hctest</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.3 "><p id="p11419643191410"><a name="p11419643191410"></a><a name="p11419643191410"></a>c</p>
</td>
</tr>
<tr id="row141915438147"><td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.1 "><p id="p441911436141"><a name="p441911436141"></a><a name="p441911436141"></a>小型系统</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.2 "><p id="p541916432142"><a name="p541916432142"></a><a name="p541916432142"></a>hcpptest</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.3 "><p id="p54191643131416"><a name="p54191643131416"></a><a name="p54191643131416"></a>c++</p>
</td>
</tr>
<tr id="row4419134341417"><td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.1 "><p id="p341964313143"><a name="p341964313143"></a><a name="p341964313143"></a>标准系统</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.2 "><p id="p10419443171416"><a name="p10419443171416"></a><a name="p10419443171416"></a>HJSUnit、hcpptest</p>
</td>
<td class="cellrowborder" valign="top" width="33.33333333333333%" headers="mcps1.2.4.1.3 "><p id="p9419143181414"><a name="p9419143181414"></a><a name="p9419143181414"></a>js、c++</p>
</td>
</tr>
</tbody>
</table>

### C语言用例开发编译指导（适用于轻量系统产品用例开发）<a name="section198193336544"></a>

**示例：轻量系统测试用例开发**

当前使用的测试框架是hctest，hctest测试框架支持使用C语言编写测试用例，是在开源测试框架unity的基础上进行增强和适配。

1.  用例目录规范：测试用例存储到test/xts/acts仓中

    ```
    ├── acts
    │ └──subsystem_lite
    │ │ └── module_hal
    │ │ │ └── BUILD.gn
    │ │ │ └── src
    │ └──build_lite
    │ │ └── BUILD.gn
    ```

2.  src目录下用例编写样例。

    1.引用测试框架

    ```
    #include "hctest.h"
    ```

    2. 使用宏定义LITE\_TEST\_SUIT定义子系统、模块、测试套件名称

    ```
    /**  
    * @brief  register a test suit named "IntTestSuite"  
    * @param  test subsystem name  
    * @param  example module name  
    * @param  IntTestSuite test suit name  
    */
    LITE_TEST_SUIT(test, example, IntTestSuite);
    ```

    3. 定义Setup与TearDown

    命名方式：测试套件名称+Setup，测试套件名称+TearDown。

    Setup与TearDown必须存在，可以为空函数。

    4. 使用宏定义LITE\_TEST\_CASE写测试用例

    包括三个参数：测试套件名称，测试用例名称，用例属性（测试类型、用例粒度、用例级别）。

    ```
    LITE_TEST_CASE(IntTestSuite, TestCase001, Function | MediumTest | Level1) 
    {  
      //do something 
    };
    ```

    5. 使用宏定义 RUN\_TEST\_SUITE注册测试套件

    ```
    RUN_TEST_SUITE(IntTestSuite);
    ```

3.  测试模块的配置文件（BUILD.gn）样例：

    在每个测试模块目录下新建BUILD.gn编译文件，用于指定编译后静态库的名称、依赖的头文件、依赖的库等；具体写法如下：

    ```
    import("//test/xts/tools/lite/build/suite_lite.gni")
    hctest_suite("ActsDemoTest") {
        suite_name = "acts"
        sources = [
            "src/test_demo.c",
        ]
        include_dirs = [ ]
        cflags = [ "-Wno-error" ]
    }
    ```

4.  acts下BUILD.gn增加编译选项。

    需要将测试模块加入到acts目录下的编译脚本中，编译脚本路径：test/xts/acts/build\_lite/BUILD.gn。

    ```
    lite_component("acts") {  
        ...
        if(board_name == "liteos_m") {
            features += [    
                ...
                "//xts/acts/subsystem_lite/module_hal:ActsDemoTest"
            ]    
        }
    }
    ```

5.  测试套件编译命令_两种编译方式。

    方式一：

    ```
    ./test/xts/tools/lite/build.sh product=wifiiot xts=acts
    ```

    方式二：

    ```
    hb set
    选择 设备类型
    hb build --gn-args build_xts=true
    (注)：若不追加--gn-args build_xts=true，不会编译acts测试套件。
    ```

    >![](figures/icon-note.gif) **说明：** 
    >acts测试套件编译中间件为静态库，最终链接到版本镜像中 。


### C语言用例执行指导（适用于轻量系统产品用例开发）<a name="section13820233175418"></a>

**示例：轻量系统测试用例执行**

将版本镜像烧录进开发板。

**测试步骤**

1.  使用串口工具登录开发板，并保存串口打印信息。
2.  重启设备，查看串口日志。

**测试结果分析指导**

基于串口打印日志进行分析；

每个测试套件执行以Start to run test suite开始，以xx Tests xx Failures xx Ignored结束。

### C++语言用例开发编译指导（适用于小型系统、标准系统用例开发）<a name="section3822123311540"></a>

**示例：小型系统测试用例开发**（标准系统参考具体样例目录：global/i18n\_standard）

当前使用的测试框架是hcpptest，hcpptest测试框架是在开源的googletest测试框架的基础上进行的增强和适配。

1.  规范用例目录：测试用例存储到test/xts/acts仓中。

    ```
    ├── acts
    │ └──subsystem_lite
    │ │ └── module_posix
    │ │ │ └── BUILD.gn
    │ │ │ └── src
    │ └──build_lite
    │ │ └── BUILD.gn
    ```

2.  测试模块src下用例编写样例：

    1. 引用测试框架：

    需要引用gtest.h  如：\#include "gtest/gtest.h"

    ```
    #include "gtest/gtest.h"
    ```

    2. 定义Setup与TearDown

    ```
    using namespace std;
    using namespace testing::ext;
    class TestSuite: public testing::Test {
    protected:
    // Preset action of the test suite, which is executed before the first test case
    static void SetUpTestCase(void){
    }
    // Test suite cleanup action, which is executed after the last test case
    static void TearDownTestCase(void){
    }
    // Preset action of the test case
    virtual void SetUp()
    {
    }
    // Cleanup action of the test case
    virtual void TearDown()
    {
    }
    };
    ```

    3. 使用宏定义HWTEST或HWTEST\_F写测试用例

    普通测试用例的定义：HWTEST（测试套名称， 测试用例名称， 用例标注）。

    包含SetUp和TearDown的测试用例的定义 ：HWTEST\_F（测试套名称， 测试用例名称，用例标注）。

    宏定义包括三个参数：测试套件名称，测试用例名称，用例属性（测试类型、用例粒度、用例级别）。

    ```
    HWTEST_F(TestSuite, TestCase_0001, Function | MediumTest | Level1) {
    // do something
    }
    ```

3.  测试模块下用例配置文件（BUILD.gn）样例：

    每个测试模块目录下新建BUILD.gn编译文件，用于指定编译后可执行文件的名称、依赖的头文件、依赖的库等；具体写法如下。每个测试模块将独立编译成.bin可执行文件， 该文件可直接push到单板上进行测试。

    举例：

    ```
    import("//test/xts/tools/lite/build/suite_lite.gni")
    hcpptest_suite("ActsDemoTest") {
        suite_name = "acts"
        sources = [
            "src/TestDemo.cpp"
        ]

        include_dirs = [
            "src",
            ...
        ]
        deps = [
            ...
        ]
        cflags = [ "-Wno-error" ]
    }

    ```

4.  acts目录下增加编译选项（BUILD.gn）样例：

    将测试模块加入到acts目录下的编译脚本中，编译脚本为：test/xts/acts/build\_lite/BUILD.gn。

    ```
     lite_component("acts") {  
    ...
    else if(board_name == "liteos_a") {
            features += [
                ...
                "//xts/acts/subsystem_lite/module_posix:ActsDemoTest"
            ]
        }
    }
    ```

5.  测试套件编译命令_两种编译方式。

    L1_LiteOS：

    ```
    方式一：
    python3 build.py -p ipcamera_hispark_taurus@hisilicon --gn-args build_xts=true 
    方式二：
    hb set
    选择 设备类型
    hb build --gn-args build_xts=true
    (注)：若不追加--gn-args build_xts=true，不会编译acts测试套件。
    ```

    L1_Linux：

    ```
    方式一：
    python3 build.py -p ipcamera_hispark_taurus_linux@hisilicon --gn-args build_xts=true 
    方式二：
    hb set
    选择 设备类型
    hb build --gn-args build_xts=true
    (注)：若不追加--gn-args build_xts=true，不会编译acts测试套件。
    ```

    >![](figures/icon-note.gif) **说明：** 
    >小型系统acts独立编译成可执行文件（bin格式）， 在编译产物的suites\\acts目录下归档。


### C++语言用例执行指导（适用于小型系统、标准系统用例开发）<a name="section128222336544"></a>

**示例：小型系统测试用例执行**

目前的用例执行采用nfs共享的方式，mount到单板去执行。

**环境搭建**

1.  使用网线或无线网络将开发板与PC进行连接。
2.  开发板配置IP、子网掩码、网关，确保开发板与PC处于同一个网段。
3.  PC安装nfs服务器并完成注册，启动nfs服务。
4.  开发板配置mount命令，确保开发板可以访问PC端的nfs共享文件。

    格式：mount \[nfs服务器IP\]:\[/nfs共享目录\] \[/开发板目录\] nfs

    举例：

    ```
    mount 192.168.1.10:/nfs /nfs nfs
    ```


**用例执行**

测试套件执行 ActsDemoTest.bin 触发用例执行，基于串口打印日志进行分析。

### JS语言用例开发指导（适用于标准系统）<a name="section159801435165220"></a>

当前使用的测试框架是HJSUnit，用于支撑OpenHarmony application测试（特指基于JS应用框架使用 Javascript 语言开发的 APP）进行自动化测试。

**用例编写基础语法**

测试用例为 js 语言，必须满足 JavaScript 语言编程规范:

**表 5** 

<a name="table13980103565212"></a>
<table><thead align="left"><tr id="row1098093545218"><th class="cellrowborder" valign="top" width="17.92179217921792%" id="mcps1.2.4.1.1"><p id="p49811235135214"><a name="p49811235135214"></a><a name="p49811235135214"></a>用例语法</p>
</th>
<th class="cellrowborder" valign="top" width="68.88688868886888%" id="mcps1.2.4.1.2"><p id="p898183565220"><a name="p898183565220"></a><a name="p898183565220"></a>描述</p>
</th>
<th class="cellrowborder" valign="top" width="13.19131913191319%" id="mcps1.2.4.1.3"><p id="p17981143512526"><a name="p17981143512526"></a><a name="p17981143512526"></a>要求</p>
</th>
</tr>
</thead>
<tbody><tr id="row1598183515528"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p139810358527"><a name="p139810358527"></a><a name="p139810358527"></a>beforeAll</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p198111352526"><a name="p198111352526"></a><a name="p198111352526"></a>测试套级别的预置条件，在所有测试用例开始前执行且仅执行一次，支持一个参数：预置动作函数</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p298114355529"><a name="p298114355529"></a><a name="p298114355529"></a>可选</p>
</td>
</tr>
<tr id="row11981103512529"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p20981135135215"><a name="p20981135135215"></a><a name="p20981135135215"></a>afterAll</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p39811935115217"><a name="p39811935115217"></a><a name="p39811935115217"></a>测试套级别的清理条件，在所有测试用例结束后执行且仅执行一次，支持一个参数：清理动作函数</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p998110354527"><a name="p998110354527"></a><a name="p998110354527"></a>可选</p>
</td>
</tr>
<tr id="row1298116359526"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p898112359526"><a name="p898112359526"></a><a name="p898112359526"></a>beforeEach</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p149811335175215"><a name="p149811335175215"></a><a name="p149811335175215"></a>测试用例级别的预置条件，在每条测试用例开始前执行，执行次数与 it 定义的测试用例数一致，支持一个参数：预置动作函数</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p13981133585212"><a name="p13981133585212"></a><a name="p13981133585212"></a>可选</p>
</td>
</tr>
<tr id="row6982435115219"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p19982133517525"><a name="p19982133517525"></a><a name="p19982133517525"></a>afterEach</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p1398213575219"><a name="p1398213575219"></a><a name="p1398213575219"></a>测试用例级别的清理条件，在每条测试用例结束后执行，执行次数与 it 定义的测试用例数一致，支持一个参数：清理动作函数</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p159821535195219"><a name="p159821535195219"></a><a name="p159821535195219"></a>可选</p>
</td>
</tr>
<tr id="row16982143513521"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p598203510527"><a name="p598203510527"></a><a name="p598203510527"></a>describe</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p5982123595215"><a name="p5982123595215"></a><a name="p5982123595215"></a>定义一个测试套，支持两个参数：测试套名称和测试套函数； describe 支持嵌套，每个 describe 内均可以定义 beforeAll 、beforeEach 、afterEach 和 afterAll</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p898217352527"><a name="p898217352527"></a><a name="p898217352527"></a>必选</p>
</td>
</tr>
<tr id="row6982113518526"><td class="cellrowborder" valign="top" width="17.92179217921792%" headers="mcps1.2.4.1.1 "><p id="p17982123510526"><a name="p17982123510526"></a><a name="p17982123510526"></a>it</p>
</td>
<td class="cellrowborder" valign="top" width="68.88688868886888%" headers="mcps1.2.4.1.2 "><p id="p598211352522"><a name="p598211352522"></a><a name="p598211352522"></a>定义一条测试用例，支持三个参数：用例名称，过滤参数和用例函数</p>
<p id="p5205769588"><a name="p5205769588"></a><a name="p5205769588"></a>备注：</p>
<p id="p6965058101"><a name="p6965058101"></a><a name="p6965058101"></a>过滤参数：过滤参数为一个 32 位的 Int 类型参数，0 位 置1表示不筛选、默认执行；0-10 位 置1表示<strong id="b9169154410212"><a name="b9169154410212"></a><a name="b9169154410212"></a>测试用例类型</strong>；16-18 位 置1表示<strong id="b1427947428"><a name="b1427947428"></a><a name="b1427947428"></a>测试用例规模</strong>；24-28 位 置1表示<strong id="b289818491213"><a name="b289818491213"></a><a name="b289818491213"></a>测试层级</strong>。</p>
<p id="p7965165151011"><a name="p7965165151011"></a><a name="p7965165151011"></a><strong id="b69449534215"><a name="b69449534215"></a><a name="b69449534215"></a>测试用例类型</strong>。置位0-10分别表示：FUNCTION 方法类测试、PERFORMANCE 性能类测试、POWER 功耗类测试、RELIABILITY 可靠性测试、SECURITY 安全合规测试、GLOBAL 整体性测试、COMPATIBILITY 兼容性测试、USER 用户测试、STANDARD 标准测试、SAFETY 安全特性测试，RESILIENCE 压力测试。</p>
<p id="p199651555102"><a name="p199651555102"></a><a name="p199651555102"></a><strong id="b10114125712211"><a name="b10114125712211"></a><a name="b10114125712211"></a>测试用例规模</strong>。置位16-18分别表示：SMALL 小型测试、MEDIUM 中型测试、LARGE 大型测试。</p>
<p id="p296545151020"><a name="p296545151020"></a><a name="p296545151020"></a><strong id="b167975581223"><a name="b167975581223"></a><a name="b167975581223"></a>测试层级</strong>。置位24-28分别表示：LEVEL0-0 级测试、LEVEL1-1 级测试、LEVEL2-2 级测试、LEVEL3-3 级测试、LEVEL4-4 级测试。</p>
</td>
<td class="cellrowborder" valign="top" width="13.19131913191319%" headers="mcps1.2.4.1.3 "><p id="p17601752115716"><a name="p17601752115716"></a><a name="p17601752115716"></a>必选</p>
</td>
</tr>
</tbody>
</table>

用例编写语法采用 jasmine 的标准语法，格式支持ES6格式。

**以FA 模式为例：**

1.  规范用例目录：测试用例存储到 src/main/js/test目录。

    ```
    ├── BUILD.gn  
    ├── Test.json                    # 资源依赖hap不需要Test.json文件
    ├── signature
    │ └──openharmony_sx.p7b          # 签名工具
    └──src
    │ └──main
    │ │ └──js
    │ │ │ └──MainAbility 
    │ │ │ │ └──app.js
    │ │ │ │ └──pages
    │ │ │ │ │ └──index   
    │ │ │ │ │ │ └──index.js                  
    │ │ │ └──test                   # 测试代码存放目录  
    │ │ │ │ │ └──List.test.js   
    │ │ │ │ │ └──Ability.test.js 
    │ │ │ └──TestAbility            # 测试框架入口模板文件，添加后无需修改 
    │ │ │ │ └──app.js   
    │ │ │ │ └──pages 
    │ │ │ │ │ └──index  
    │ │ │ │ │ │ └──index.js  
    │ │ │ └──TestRunner             # 测试框架入口模板文件，添加后无需修改 
    │ │ │ │ └──OpenHarmonyTestRunner.js   
    │ └── resources                 # hap资源存放目录
    │ └── config.json               # hap配置文件
    ```

2.  OpenHarmonyTestRunner.js 示例

    ```
    //加载js 测试框架
    import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

    ...

     export default {
        ...
        onRun() {
            console.log('OpenHarmonyTestRunner onRun run')
            var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

            var testAbilityName = abilityDelegatorArguments.parameters['-p'] + '.MainAbility'

            var cmd = 'aa start -d 0 -a ' + testAbilityName + ' -b ' + abilityDelegatorArguments.bundleName
            ...
        }
    };
    ```

3.  index.js示例

    ```
    export default {
        ...
        onShow() {
            console.info('onShow finish!')
        },
        ...
    }
    ```

4.  app.js示例

    ```
    //加载测试用例
    import { Hypium } from '@ohos/hypium'
    import testsuite from '../test/List.test'
    export default {
        onCreate() {
            console.info('TestApplication onCreate');
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
            console.info('start run testcase!!!')
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        },
        ...
    };
    ```

5.  单元测试用例示例

    ```
    // Example1: 使用HJSUnit进行单元测试
    describe('appInfoTest', function () {    
        it('app_info_test_001', 0, function () {
            var info = app.getInfo()
            expect(info.versionName).assertEqual('1.0')
            expect(info.versionCode).assertEqual('3')
        })
    }) 
    ```


FA_JS 模式测试模块下用例配置文件（BUILD.gn）样例：

```
import("//test/xts/tools/build/suite.gni")

ohos_js_hap_suite("ActsDemoTest") {
  hap_profile = "./src/main/config.json"
  deps = [
    ":hjs_demo_js_assets",
    ":hjs_demo_resources",
  ]
  certificate_profile = "./signature/openharmony_sx.p7b"    //签名文件
  hap_name = "ActsDemoTest"                                 //测试套件，以Acts开头，以Test结尾，采用驼峰式命名
  part_name = "..."                                         //部件
  subsystem_name = "..."                                    //子系统
}
ohos_js_assets("hjs_demo_js_assets") {
  js2abc = true
  hap_profile = "./src/main/config.json"
  source_dir = "./src/main/js"
}
ohos_resources("hjs_demo_resources") {
  sources = [ "./src/main/resources" ]
  hap_profile = "./src/main/config.json"
}
```

FA_TS 模式测试模块下用例配置文件（BUILD.gn）样例：

```
import("//test/xts/tools/build/suite.gni")

ohos_js_hap_suite("ActsDemoTest") {
  hap_profile = "./src/main/config.json"
  deps = [
    ":ace_demo_ets_assets",
    ":ace_demo_ets_resources",
    ":ace_demo_ets_test_assets",
  ]
  ets2abc = true
  certificate_profile = "./signature/openharmony_sx.p7b"   //签名文件
  hap_name = "ActsDemoTest"                                //测试套件，以Acts开头，以Test结尾，采用驼峰式命名
  part_name = "..."                                        //部件
  subsystem_name = "..."                                   //子系统
}
ohos_js_assets("ace_demo_ets_assets") {
  source_dir = "./src/main/ets/MainAbility"
}
ohos_js_assets("ace_demo_ets_test_assets") {
  source_dir = "./src/main/ets/TestAbility"
}
ohos_resources("ace_demo_ets_resources") {
  sources = [ "./src/main/resources" ]
  hap_profile = "./src/main/config.json"
}
```

FA_JS 模式适配指导请参考

​                  [JS工程目录结构（FA模型）](https://gitcode.com/openharmony/xts_acts/wikis/XTS_%E7%99%BE%E7%A7%91%E6%8C%87%E5%AF%BC/JS%E5%B7%A5%E7%A8%8B%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%EF%BC%88FA%E6%A8%A1%E5%9E%8B%EF%BC%89)

FA_TS 模式适配指导请参考 

​                  [eTS工程目录结构（FA模型）](https://gitcode.com/openharmony/xts_acts/wikis/XTS_%E7%99%BE%E7%A7%91%E6%8C%87%E5%AF%BC/eTS%E5%B7%A5%E7%A8%8B%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%EF%BC%88FA%E6%A8%A1%E5%9E%8B%EF%BC%89)

**以Stage 模式为例：**

1. 规范用例目录：测试用例存储到 src/main/js/test目录。

   ```
   ├── BUILD.gn                     # 配置文件
   ├── Test.json                    # 资源依赖hap不需要Test.json文件
   ├── signature
   │ └──openharmony_sx.p7b          # 签名工具
   ├── AppScope
   │ └──resource  
   │ └──app.json
   ├── entry
   │ └──src
   │ │ └──main
   │ │ │ └──ets         
   │ │ │ │ └──test                   # 测试代码存放目录  
   │ │ │ │ │ └──List.test.ets   
   │ │ │ │ │ └──Ability.test.ets 
   │ │ │ │ └──MainAbility      
   │ │ │ │ │ └──MainAbility.ts         
   │ │ │ │ │ └──pages            
   │ │ │ │ │ │ └──index 
   │ │ │ │ │ │ │ └──index.ets     
   │ │ │ │ └──TestAbility      
   │ │ │ │ │ └──TestAbility.ts       # 测试用例启动入口 ability    
   │ │ │ │ │ └──pages            
   │ │ │ │ │ │ └──index.ets                
   │ │ │ │ └──Application              
   │ │ │ │ │ └──AbilityStage.ts   
   │ │ │ │ └──TestRunner             # 测试框架入口模板文件，添加后无需修改 
   │ │ │ │ │ └──OpenHarmonyTestRunner.js  
   │ │ └── resources                 # hap资源存放目录
   │ │ └── module.json               # hap配置文件
   ```

2. OpenHarmonyTestRunner.ts 示例

   【注】在TestRunner目录下的 OpenHarmonyTestRunner.ts 文件中的 async onRun() 方法下存在拉起测试套入口xxxAbility的cmd 命令：

   例如：

   var cmd = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName

   需与module.json中 "abilities" 下的 "name" 字段保持一致，保证拉起的是我们需要的测试入口。

   ```
   import TestRunner from '@ohos.application.testRunner'
   import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

   ...

   export default class OpenHarmonyTestRunner implements TestRunner {
       ...
       async onRun() {
           console.log('OpenHarmonyTestRunner onRun run')
           abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
           abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
           var testAbilityName = abilityDelegatorArguments.bundleName + '.TestAbility'
           let lMonitor = {
               abilityName: testAbilityName,
               onAbilityCreate: onAbilityCreateCallback,
           };
           abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback)
           var cmd = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName
           ...
       }
   };
   ```

3. index.ets示例

   ```
   import router from '@ohos.router';

   @Entry
   @Component
   struct Index {

     aboutToAppear(){
       console.info("start run testcase!!!!")
     }

     build() {
       ...
     }
   }
   ```

4. app.js示例

   ```
   //加载测试用例
   import Ability from '@ohos.app.ability.UIAbility'
   import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
   import { Hypium } from '@ohos/hypium'
   import testsuite from '../test/List.test'
   
   export default class TestAbility extends Ability {
       onCreate(want, launchParam) {
           console.log('TestAbility onCreate')
           var abilityDelegator: any
           abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
           var abilityDelegatorArguments: any
           abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
           console.info('start run testcase!!!')
           Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
       }
       ...
   };
   ```

Stage 模式测试模块下用例配置文件（BUILD.gn）样例：

```
import("//test/xts/tools/build/suite.gni")

ohos_js_hap_suite("ActsDemoTest") {
  hap_profile = "/src/main/module.json"
  js_build_mode = "debug"
  deps = [
    ":edm_js_assets",
    ":edm_resources",
  ]
  ets2abc = true
  certificate_profile = "signature/openharmony_sx.p7b"     //签名文件
  hap_name = "ActsDemoTest"                                //测试套件，以Acts开头，以Test结尾，采用驼峰式命名
  subsystem_name = "customization"                         //子系统
  part_name = "enterprise_device_management"               //部件
}

ohos_app_scope("edm_app_profile") {
  app_profile = "AppScope/app.json"
  sources = [ "AppScope/resources" ]
}

ohos_js_assets("edm_js_assets") {
  source_dir = "/src/main/ets"
}

ohos_resources("edm_resources") {
  sources = [ "/src/main/resources" ]
  deps = [ ":edm_app_profile" ]
  hap_profile = "/src/main/module.json"
}
```

Stage 模式适配指导请参考 

​                          [eTS工程目录结构（Stage模型）](https://gitcode.com/openharmony/xts_acts/wikis/XTS_%E7%99%BE%E7%A7%91%E6%8C%87%E5%AF%BC/eTS%E5%B7%A5%E7%A8%8B%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%EF%BC%88Stage%E6%A8%A1%E5%9E%8B%EF%BC%89)

### JS语言用例编译打包指导（适用于标准系统）<a name="section445519106559"></a>

hap包编译请参考 [标准系统 JS用例源码编译Hap包指导](https://gitcode.com/openharmony/xts_acts/wikis/%E6%A0%87%E5%87%86%E7%B3%BB%E7%BB%9F%20JS%E7%94%A8%E4%BE%8B%E6%BA%90%E7%A0%81%E7%BC%96%E8%AF%91Hap%E5%8C%85%E6%8C%87%E5%AF%BC%20?sort_id=4427112)。

### Python用例开发编译指导 <a name="section281040146993"></a>

XTS当前支持执行Python测试用例，可用于系统黑盒测试，并提供了对设备进行操作的接口，包括执行Shell命令、文件传输、应用安装卸载等。

**用例开发指导**

Python用例开发有两种模式，分别是测试用例模式和测试套模式。

1. 测试用例模式

测试用例由一个测试用例json配置文件和一个Python测试脚本py文件组成。

用例目录示例：
```
├── BUILD.gn                     # 编译配置文件
├── TestCase.json                # 测试用例配置文件
├── testcase1.py                 # 测试用例Python脚本
```

json配置文件描述测试用例的配置信息，如环境设备信息、测试驱动信息、测试所需kit等。其中需指定测试用例执行驱动类型为 'DeviceTest'，并指定Python测试脚本路径（测试用例模式仅可指定一个py文件）。测试用例配置文件示例：
```
// TestCase.json

{
    "description": "Configuration for Openharmony device test case",
    // environment 字段描述测试套执行所需环境信息，如设备数量、类型等
    "environment": [
        {
            "type": "device",       // device 表示 OpenHarmony 设备
            "label": "phone"
        }
    ],
    // driver 字段描述测试用例执行所需驱动、测试用例文件路径等
    "driver": {
        "type": "DeviceTest",
        "py_file": ["testcase1.py"]
    },
    // kits 字段描述测试用例需要的测试公共kit，如 pushkit 、 shellkit 等
    "kits": [    
    ]
}
```

<a name="testcase"></a>

Python测试用例继承'TestCase'，需重写三个生命周期函数。测试用例Python脚本示例如下：
| 生命周期函数 | 说明 |
| ----- | ----- |
| setup | 测试用例前置步骤，用于执行测试用例的预置动作 |
| process | 测试用例实际操作步骤，用于执行测试用例实际测试步骤 |
| teardown | 测试用例清理步骤，用于执行测试用例的环境清理等操作 |

```
// testcase1.py

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from devicetest.core.test_case import TestCase, Step

class testcase1(TestCase):
    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        # driver1 表示 TestCase.json 中定义的环境设备
        res = self.device1.execute_shell_command("ls -l")
        # 使用该方式打印日志，可将输出保留在测试报告中
        self.log.info(res)
        # 使用断言判断测试通过与否
        assert res != ""

    def teardown(self):
        Step("Teardown")
```

2. 测试套模式

测试套由一个测试套json配置文件、一个测试套py文件、多个Python测试脚本py文件组成。

用例目录示例：
```
├── BUILD.gn                     # 编译配置文件
├── TestSuite.json               # 测试套json配置文件
├── TestSuite.py                 # 测试套py文件
├── testcase1.py                 # Python测试脚本py文件
├── testcase2.py                 
├── testcase3.py                 
```

json配置文件中需指定测试套执行驱动类型为 'DeviceTestSuite'，并指定测试套py文件和Python测试脚本路径。测试套配置文件示例如下：
```
// TestSuite.json

{
    "description": "Configuration for Openharmony device test suite",
    // environment 字段描述测试套执行所需环境信息，如设备类型等
    "environment": [
        {
            "type": "device",           // device 表示 OpenHarmony 设备
            "label": "phone"
        }
    ],
    // driver 字段描述测试套执行所需驱动、测试套py文件路径、所包含所有测试脚本路径等
    "driver": {
        "type": "DeviceTestSuite",
        "testsuite": "TestSuite.py",
        "suitecases": [
            "./testcase1.py",
            "./testcase2.py",
            "./testcase3.py"
        ]
    },
    // kits 字段描述测试套需要的测试公共kit，如 pushkit 、 shellkit 等
    "kits": [    
    ]
}
```

> **注：**  Python测试脚本若与测试套py文件在同一目录下且以'TC_'开头，则无需在json配置文件中配置 'suitecases'，框架将自动扫描执行所有符合条件的测试用例。(若已配置 'suitecases' 且不为空，框架则不再自动扫描)

测试套需继承'TestSuite'，并重写两个生命周期函数。 测试套py文件示例如下：

| 生命周期函数 | 说明 |
| ----- | ----- |
| setup | 整个测试套的前置步骤，在测试套运行前先执行该函数 |
| teardown | 整个测试套的清理步骤，在测试套运行后执行该函数 |

```
// TestSuite.py

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from devicetest.core.test_case import Step
from devicetest.core.suite.test_suite import TestSuite

class TestSuite(TestSuite):
    def setup(self):
        Step("Setup")

    def teardown(self):
        Step("Teardown")
```

[测试套模式Python测试脚本示例，同测试用例模式](#testcase)

**接口参考**

| <div style="width:300px">接口定义</div> | 参数说明 | 返回值 | 接口说明 |
| ----- | ----- | ----- | ----- |
| execute_shell_command(command, timeout) | 1. command：必选，shell命令字符串 <br> 2. timeout：可选，命令执行超时时间，单位 ms，执行超时抛出异常 | shell命令执行输出 | 执行shell命令 |
| reboot() | 无 | 无 | 设备重启 |
| install_package(package_path) | package_path：必选，应用包路径 | bm安装命令执行输出 | 安装应用 |
| uninstall_package(package_name) | package_name：必选，应用包名 | bm卸载命令执行输出 | 卸载应用 |
| pull_file(remote, local) | 1. remote：必选，设备文件路径 <br> 2. local：必选，本地文件路径 | 无 | 设备pull文件到本地 |
| push_file(local, remote) | 1. local：必选，本地文件路径 <br> 2. remote：必选，设备文件路径 | 无 | 本地push文件到设备 |

> **注：**  ```install_package()```、```push_file()``` 等以本地路径作为参数的接口，需要将本地文件放置到 resource 目录下并通过 ```get_resource_path()``` 获取本地文件路径，示例如下：
> ```
> from devicetest.utils.file_util import get_resource_path
>
> path = get_resource_path('test.hap') // resource目录下的相对路径
> res = self.device1.install_package(path)
> ```

**用例编译指导**

编译配置文件 BUILD.gn 主要将测试用例py文件及json文件拷贝到xts输出目录下。编译配置文件示例如下（以测试用例模式为例）：
```
// BUILD.gn

import("//build/ohos.gni")

group("ActsDemoTest") {
  testonly = true
  deps = [ ":PyTestCase" ]
}
ohos_copy("PyTestCase") {
  subsystem_name = "..."
  part_name = "..."
  sources = [
    "./TestCase.json",
    "./testcase1.py",
  ]
  outputs =
      [ root_out_dir + "/suites/acts/acts/testcases/{{source_file_part}}" ]
}
```

### Python脚本用例执行指导 <a name="section637497153319"></a>

**测试用例模式：**

``` run -l TestCase ```

**测试套模式：**

全量执行：``` run -l TestSuite ```

部分执行：``` run -l TestSuite -ta class:testcase1,testcase3 ```

部分不执行：``` run -l TestSuite -ta notClass:testcase1,testcase3 ```

### 全量编译指导（适用于标准系统）<a name="section159801435165220"></a>

1.  全量编译
    test/xts/acts目录下执行编译命令：

    ```
    ./build.sh product_name=rk3568 system_size=standard
    ```

2.  单个子系统编译

    test/xts/acts目录下执行编译命令：

    ```
    ./build.sh product_name=rk3568 system_size=standard target_subsystem=××××
    ```

3.  单模块编译

    test/xts/acts目录下执行编译命令：

    ```./build.sh suite=acts system_size=standard target_subsystem=××××
    ./build.sh product_name=rk3568 system_size=standard suite=xxx
    suite 后面添加的是BUILD.gn 中ohos_js_hap_suite模板的命名
    ```

    测试用例输出目录：out/rk3568/suites/acts/testcases

    测试框架&用例整体输出目录：out/rk3568/suites/acts（编译用例时会同步编译测试套执行框架）

### 全量用例执行指导（适用于小型系统、标准系统）<a name="section159801435165220"></a>

搭建测试环境Windows工作台下安装python3.7及以上版本，确保工作台和测试设备正常连接。

**注：高版本python不带 easy_install，可以安装低于 52.0.0 的 setuptools，解决该问题。**

```
pip install setuptools==50.0.0
```

测试执行目录（对应编译生成的out/release/suites/acts目录）

    ├── testcase                       # 测试套文件存放目录 
    │ └──xxx.hap                       # 测试套可执行hap文件
    │ └──xxx.json                      # 测试套对应执行配置文件
    ├── tools                          # 测试框架工具目录
    ├── run.bat                        # window平台测试套启动执行文件
    ├── report                         # 测试报告生成目录

用例执行
1.  在Windows工作台上，找到从Linux服务器上拷贝下来的测试套件用例目录，在Windows命令窗口进入对应目录，直接执行acts\run.bat。

2.  界面启动后，输入用例执行指令。

    全量执行：```run acts ```

    模块执行(具体模块可以查看\acts\testcases\)：```run –l ActsSamgrTest ```

    单包执行(具体模块可以查看\acts\testcases\)：（适用于OH驱动）

    ```
    run -l uitestActs -ta class:UiTestCase#testChecked  

    uitestActs： 测试hap
    UiTestCase: testsuite
    testChecked: testcase
    ```


3.  查看测试报告。
    进入acts\reports\，获取当前的执行记录，打开“summary_report.html”可以获取到测试报告。

## 相关仓<a name="section1371113476307"></a>

**xts\_acts**

[xts\_tools](https://gitcode.com/openharmony/xts_tools)

