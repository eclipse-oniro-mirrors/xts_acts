# Vulkan测试套件说明

- [介绍](#section_Vulkan_001)
- [使用说明](#section_Vulkan_002)

## 介绍<a name="section_Vulkan_001"></a>

Vulkan测试套件使用VK-GL-CTS三方库内原有的vulkancts，通过acts测试套件框架在运行时调用运行，具体目录结构如下：

```bash
.
├── BUILD.gn
├── comm.gni
├── cpVulkan.sh
├── genlocal.py
├── README_zh.md
├── src
│   ├── ActsVulkanTest.cpp
│   ├── ActsVulkanTest.h
│   ├── apitest
│   │   ├── ActsVulkanApiTest.cpp
│   │   ├── ActsVulkanApiTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── bindingmodeltest
│   │   ├── ActsVulkanBinding_modelTest.cpp
│   │   ├── ActsVulkanBinding_modelTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── clippingtest
│   │   ├── ActsVulkanClippingTest.cpp
│   │   ├── ActsVulkanClippingTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── computetest
│   │   ├── ActsVulkanComputeTest.cpp
│   │   ├── ActsVulkanComputeTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── conditionalrenderingtest
│   │   ├── ActsVulkanConditional_renderingTest.cpp
│   │   ├── ActsVulkanConditional_renderingTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── descriptorindexingtest
│   │   ├── ActsVulkanDescriptor_indexingTest.cpp
│   │   ├── ActsVulkanDescriptor_indexingTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── devicegrouptest
│   │   ├── ActsVulkanDevice_groupTest.cpp
│   │   ├── ActsVulkanDevice_groupTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── drawtest
│   │   ├── ActsVulkanDrawTest.cpp
│   │   ├── ActsVulkanDrawTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── drmformatmodifierstest
│   │   ├── ActsVulkanDrm_format_modifiersTest.cpp
│   │   ├── ActsVulkanDrm_format_modifiersTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── dynamicrenderingtest
│   │   ├── ActsVulkanDynamic_renderingTest.cpp
│   │   ├── ActsVulkanDynamic_renderingTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── dynamicstatetest
│   │   ├── ActsVulkanDynamic_stateTest.cpp
│   │   ├── ActsVulkanDynamic_stateTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── fastlinkedlibrary
│   │   ├── ActsVulkanFastlinkedLibraryTest.cpp
│   │   ├── ActsVulkanFastlinkedLibraryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── fractionmandatorytests
│   │   ├── ActsVulkanFraction_mandatory_testsTest.cpp
│   │   ├── ActsVulkanFraction_mandatory_testsTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── fragmentoperationstest
│   │   ├── ActsVulkanFragment_operationsTest.cpp
│   │   ├── ActsVulkanFragment_operationsTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── fragmentshaderinterlocktest
│   │   ├── ActsVulkanFragment_shader_interlockTest.cpp
│   │   ├── ActsVulkanFragment_shader_interlockTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── fragmentshadingratetest
│   │   ├── ActsVulkanFragment_shading_rateTest.cpp
│   │   ├── ActsVulkanFragment_shading_rateTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── geometrytest
│   │   ├── ActsVulkanGeometryTest.cpp
│   │   ├── ActsVulkanGeometryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── glsltest
│   │   ├── ActsVulkanGlslTest.cpp
│   │   ├── ActsVulkanGlslTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── graphicsfuzztest
│   │   ├── ActsVulkanGraphicsfuzzTest.cpp
│   │   ├── ActsVulkanGraphicsfuzzTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── imagelessframebuffertest
│   │   ├── ActsVulkanImageless_framebufferTest.cpp
│   │   ├── ActsVulkanImageless_framebufferTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── imagetest
│   │   ├── ActsVulkanImageTest.cpp
│   │   ├── ActsVulkanImageTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── infotest
│   │   ├── ActsVulkanInfoTest.cpp
│   │   ├── ActsVulkanInfoTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── mastertest
│   │   ├── ActsVulkanMasterTest.cpp
│   │   ├── ActsVulkanMasterTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── memorymodeltest
│   │   ├── ActsVulkanMemory_modelTest.cpp
│   │   ├── ActsVulkanMemory_modelTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── memorytest
│   │   ├── ActsVulkanMemoryTest.cpp
│   │   ├── ActsVulkanMemoryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── meshshadertest
│   │   ├── ActsVulkanMesh_shaderTest.cpp
│   │   ├── ActsVulkanMesh_shaderTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── monolithic
│   │   ├── ActsVulkanMonolithicTest.cpp
│   │   ├── ActsVulkanMonolithicTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── multiviewtest
│   │   ├── ActsVulkanMultiviewTest.cpp
│   │   ├── ActsVulkanMultiviewTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── pipelinelibrary
│   │   ├── ActsVulkanPipelineLibraryTest.cpp
│   │   ├── ActsVulkanPipelineLibraryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── protectedmemorytest
│   │   ├── ActsVulkanProtected_memoryTest.cpp
│   │   ├── ActsVulkanProtected_memoryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── querypooltest
│   │   ├── ActsVulkanQuery_poolTest.cpp
│   │   ├── ActsVulkanQuery_poolTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── rasterizationtest
│   │   ├── ActsVulkanRasterizationTest.cpp
│   │   ├── ActsVulkanRasterizationTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── rayquerytest
│   │   ├── ActsVulkanRay_queryTest.cpp
│   │   ├── ActsVulkanRay_queryTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── raytracingpipelinetest
│   │   ├── ActsVulkanRay_tracing_pipelineTest.cpp
│   │   ├── ActsVulkanRay_tracing_pipelineTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── reconvergencetest
│   │   ├── ActsVulkanReconvergenceTest.cpp
│   │   ├── ActsVulkanReconvergenceTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── renderpass2test
│   │   ├── ActsVulkanRenderpass2Test.cpp
│   │   ├── ActsVulkanRenderpass2Test.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── renderpasstest
│   │   ├── ActsVulkanRenderpassTest.cpp
│   │   ├── ActsVulkanRenderpassTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── robustnesstest
│   │   ├── ActsVulkanRobustnessTest.cpp
│   │   ├── ActsVulkanRobustnessTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── sparseresourcestest
│   │   ├── ActsVulkanSparse_resourcesTest.cpp
│   │   ├── ActsVulkanSparse_resourcesTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── spirvassemblytest
│   │   ├── ActsVulkanSpirv_assemblyTest.cpp
│   │   ├── ActsVulkanSpirv_assemblyTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── ssbotest
│   │   ├── ActsVulkanSsboTest.cpp
│   │   ├── ActsVulkanSsboTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── subgroupstest
│   │   ├── ActsVulkanSubgroupsTest.cpp
│   │   ├── ActsVulkanSubgroupsTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── synchronization2test
│   │   ├── ActsVulkanSynchronization2Test.cpp
│   │   ├── ActsVulkanSynchronization2Test.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── synchronizationtest
│   │   ├── ActsVulkanSynchronizationTest.cpp
│   │   ├── ActsVulkanSynchronizationTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── tessellationtest
│   │   ├── ActsVulkanTessellationTest.cpp
│   │   ├── ActsVulkanTessellationTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── testissuestest
│   │   ├── ActsVulkanTest_issuesTest.cpp
│   │   ├── ActsVulkanTest_issuesTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── texturetest
│   │   ├── ActsVulkanTextureTest.cpp
│   │   ├── ActsVulkanTextureTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── transformfeedbacktest
│   │   ├── ActsVulkanTransform_feedbackTest.cpp
│   │   ├── ActsVulkanTransform_feedbackTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── ubotest
│   │   ├── ActsVulkanUboTest.cpp
│   │   ├── ActsVulkanUboTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   ├── wsitest
│   │   ├── ActsVulkanWsiTest.cpp
│   │   ├── ActsVulkanWsiTest.h
│   │   ├── BUILD.gn
│   │   └── Test.json
│   └── ycbcrtest
│       ├── ActsVulkanYcbcrTest.cpp
│       ├── ActsVulkanYcbcrTest.h
│       ├── BUILD.gn
│       └── Test.json
└── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译Vulkan三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立Vulkandata目录，然后将运行测试需要的Vulkan测试进程，解析运行日志所需的Python脚本拷贝到Vulkandata目录。
* comm.gni：通用编译配置。
* cpVulkan.sh：编译后actions事件执行的脚本。
* genlocal.py：Vulkan的test程序运行后结果会保存在task_log.log文件内，分析运行日志后会存储结果在summary_report.xml文件内，然后根据xdevice流程生成summary_report。
* src：测试套件的实现，内部直接调用Vulkan的unittest进程。
* Test.json：运行测试需要json脚本，包括拷贝内容到开发板。


## 使用说明<a name="section_Vulkan_002"></a>

* 编译运行

  ```bash
  ./build.sh --product-name rk3568 --gn-args build_xts=true --build-target "acts" --gn-args is_standard_system=true
  ```

* 测试运行：进入suites/acts目录，执行python -m xdevice，然后在命令框里输入一下命令

  ```bash
  run -l ActsVulkanApiTest,
  run -l ActsVulkanBindingmodelTest,
  run -l ActsVulkanClippingTest,
  run -l ActsVulkanComputeTest,
  run -l ActsVulkanConditionalrenderingTest,
  run -l ActsVulkanDescriptorindexingTest,
  run -l ActsVulkanDevicegroupTest,
  run -l ActsVulkanDrawTest,
  run -l ActsVulkanDrmformatmodifiersTest,
  run -l ActsVulkanDynamicrenderingTest,
  run -l ActsVulkanDynamicstateTest,
  run -l ActsVulkanFastlinkedLibraryTest,
  run -l ActsVulkanFractionmandatorytestsTest,
  run -l ActsVulkanFragmentoperationsTest,
  run -l ActsVulkanFragmentshaderinterlockTest,
  run -l ActsVulkanFragmentshadingrateTest,
  run -l ActsVulkanGeometryTest,
  run -l ActsVulkanGlslTest,
  run -l ActsVulkanGraphicsfuzzTest,
  run -l ActsVulkanImagelessframebufferTest,
  run -l ActsVulkanImageTest,
  run -l ActsVulkanInfoTest,
  run -l ActsVulkanMasterTest,
  run -l ActsVulkanMemorymodelTest,
  run -l ActsVulkanMemoryTest,
  run -l ActsVulkanMeshshaderTest,
  run -l ActsVulkanMonolithicTest,
  run -l ActsVulkanMultiviewTest,
  run -l ActsVulkanPipelineLibraryTest,
  run -l ActsVulkanProtectedmemoryTest,
  run -l ActsVulkanQuerypoolTest,
  run -l ActsVulkanRasterizationTest,
  run -l ActsVulkanRayqueryTest,
  run -l ActsVulkanRaytracingpipelineTest,
  run -l ActsVulkanReconvergenceTest,
  run -l ActsVulkanRenderpass2Test,
  run -l ActsVulkanRenderpassTest,
  run -l ActsVulkanRobustnessTest,
  run -l ActsVulkanSparseresourcesTest,
  run -l ActsVulkanSpirvassemblyTest,
  run -l ActsVulkanSsboTest,
  run -l ActsVulkanSubgroupsTest,
  run -l ActsVulkanSynchronization2Test,
  run -l ActsVulkanSynchronizationTest,
  run -l ActsVulkanTessellationTest,
  run -l ActsVulkanTestissuesTest,
  run -l ActsVulkanTextureTest,
  run -l ActsVulkanTransformfeedbackTest,
  run -l ActsVulkanUboTest,
  run -l ActsVulkanWsiTest,
  run -l ActsVulkanYcbcrTest
  ```

* vkgl测试套件运行结束会生成qpa文件方便开发人员调试，qpa文件可以通过vk-gl-cts/scripts/log内的脚本进行解析，具体命令如下：

  ```bash
  python2 log_to_xml.py TestResults.qpa TestResults.xml
  ```
