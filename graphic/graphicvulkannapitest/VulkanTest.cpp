/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstddef>
#include <window.h>
#include <gtest/gtest.h>
#include <dlfcn.h>
#include <iostream>
#include <string>
#include <vector>
#include <sstream>

#include "refbase.h"
#include "surface.h"
#include "vulkan/vulkan.h"
#include "render_context/render_context.h"
#include "transaction/rs_transaction.h"
#include "ui/rs_surface_extractor.h"
#include "ui/rs_surface_node.h"

using namespace testing;
using namespace testing::ext;
using namespace OHOS::Rosen;

namespace vulkan::loader {
class VulkanLoaderUnitTest : public testing::Test {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase();
    void SetUp() {}
    void TearDown() {}
    uint32_t GetQueueFamilyIndex(VkQueueFlagBits queueFlags);
    OHNativeWindow* CreateNativeWindow(std::string name);
    VkSwapchainCreateInfoKHR GetSwapchainCreateInfo(VkFormat imageFormat, VkColorSpaceKHR imageColorSpace);
    static VkBool32 UserCallback(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity,
        VkDebugUtilsMessageTypeFlagsEXT messageType,
        const VkDebugUtilsMessengerCallbackDataEXT* pCallbackData,
        void* pUserData);

    static inline bool DLOpenLibVulkan();
    static inline void TrytoCreateVkInstance();

    static inline PFN_vkEnumerateInstanceExtensionProperties vkEnumerateInstanceExtensionProperties;
    static inline PFN_vkEnumerateDeviceExtensionProperties vkEnumerateDeviceExtensionProperties;
    static inline PFN_vkEnumerateInstanceLayerProperties vkEnumerateInstanceLayerProperties;
    static inline PFN_vkEnumerateDeviceLayerProperties vkEnumerateDeviceLayerProperties;
    static inline PFN_vkCreateDebugUtilsMessengerEXT vkCreateDebugUtilsMessengerEXT;
    static inline PFN_vkDestroyDebugUtilsMessengerEXT vkDestroyDebugUtilsMessengerEXT;
    static inline PFN_vkCreateInstance vkCreateInstance;
    static inline PFN_vkGetInstanceProcAddr vkGetInstanceProcAddr;
    static inline PFN_vkGetDeviceProcAddr vkGetDeviceProcAddr;

    static inline PFN_vkDestroyInstance vkDestroyInstance;
    static inline PFN_vkDestroySurfaceKHR vkDestroySurfaceKHR;
    static inline PFN_vkCreateDevice vkCreateDevice;
    static inline PFN_vkDestroyDevice vkDestroyDevice;
    static inline PFN_vkEnumeratePhysicalDevices vkEnumeratePhysicalDevices;
    static inline PFN_vkCreateSurfaceOHOS vkCreateSurfaceOHOS;
    static inline PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR fpGetPhysicalDeviceSurfaceCapabilitiesKHR;
    static inline PFN_vkGetPhysicalDeviceSurfacePresentModesKHR fpGetPhysicalDeviceSurfacePresentModesKHR;
    static inline PFN_vkGetPhysicalDeviceSurfaceFormatsKHR fpGetPhysicalDeviceSurfaceFormatsKHR;
    static inline PFN_vkCreateSwapchainKHR fpCreateSwapchainKHR;
    static inline PFN_vkDestroySwapchainKHR fpDestroySwapchainKHR;
    static inline PFN_vkAcquireNextImage2KHR fpAcquireNextImage2KHR;
    static inline PFN_vkQueuePresentKHR fpQueuePresentKHR;
    static inline PFN_vkGetPhysicalDeviceQueueFamilyProperties vkGetPhysicalDeviceQueueFamilyProperties;
    static inline PFN_vkGetPhysicalDeviceProperties vkGetPhysicalDeviceProperties;
    static inline PFN_vkGetPhysicalDeviceFeatures vkGetPhysicalDeviceFeatures;
    static inline PFN_vkGetPhysicalDeviceMemoryProperties vkGetPhysicalDeviceMemoryProperties;
    static inline PFN_vkGetPhysicalDeviceSurfaceSupportKHR vkGetPhysicalDeviceSurfaceSupportKHR;
    static inline PFN_vkGetSwapchainImagesKHR fpGetSwapchainImagesKHR;
    static inline PFN_vkGetNativeBufferPropertiesOHOS fpGetNativeBufferPropertiesOHOS;
    static inline PFN_vkGetMemoryNativeBufferOHOS fpGetMemoryNativeBufferOHOS;

    static inline void *libVulkan_ = nullptr;
    static inline VkInstance instance_ = nullptr;
    static inline VkSurfaceKHR surface_ = VK_NULL_HANDLE;
    static inline VkPhysicalDevice physicalDevice_ = nullptr;
    static inline VkDevice device_ = nullptr;
    static inline VkSurfaceCapabilitiesKHR surfCaps_ = {};
    static inline VkSurfaceFormatKHR surfaceFormat_ = {};
    static inline VkSwapchainKHR swapChain_ = VK_NULL_HANDLE;
    static inline VkSwapchainKHR swapChain2_ = VK_NULL_HANDLE;
    static inline VkSemaphore semaphore_ = VK_NULL_HANDLE;
    static inline bool isSupportedVulkan_ = false;
    static inline std::vector<VkQueueFamilyProperties> queueProps_;
    static inline uint32_t queueCount_;
    static inline VkDebugUtilsMessengerEXT debugUtilsMessenger = VK_NULL_HANDLE;
    static inline std::stringstream debugMessage_;
};

bool VulkanLoaderUnitTest::DLOpenLibVulkan()
{
#if (defined(__aarch64__) || defined(__x86_64__))
    const char *path = "/system/lib64/libvulkan.so";
#else
    const char *path = "/system/lib/libvulkan.so";
#endif
    libVulkan_ = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (libVulkan_ == nullptr) {
        std::cout << "dlerror: " << dlerror() << std::endl;
        std::cout << "isSupportedVulkan_: false" << std::endl;
        return false;
    }
    return true;
}

void VulkanLoaderUnitTest::TrytoCreateVkInstance()
{
    VkApplicationInfo appInfo = {};
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pApplicationName = "pApplicationName";
    appInfo.pEngineName = "pEngineName";
    appInfo.apiVersion = VK_API_VERSION_1_0;

    std::vector<const char*> instanceExtensions = {
        VK_KHR_SURFACE_EXTENSION_NAME,
        VK_OHOS_SURFACE_EXTENSION_NAME,
        VK_EXT_DEBUG_UTILS_EXTENSION_NAME
    };

    VkInstanceCreateInfo instanceCreateInfo = {};
    instanceCreateInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    instanceCreateInfo.pNext = NULL;
    instanceCreateInfo.pApplicationInfo = &appInfo;

    instanceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(instanceExtensions.size());
    instanceCreateInfo.ppEnabledExtensionNames = instanceExtensions.data();

    VkResult result = vkCreateInstance(&instanceCreateInfo, nullptr, &instance_);
    std::cout << "instance_ ptr: " << instance_ << std::endl;
    if (result != VK_SUCCESS || instance_ == nullptr) {
        isSupportedVulkan_ = false;
    } else {
        isSupportedVulkan_ = true;
    }
    std::cout << "set isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    std::cout << "TrytoCreateVkInstance result: " << result << std::endl;
}

VkSwapchainCreateInfoKHR VulkanLoaderUnitTest::GetSwapchainCreateInfo(
    VkFormat imageFormat, VkColorSpaceKHR imageColorSpace)
{
        VkSwapchainCreateInfoKHR swapchainCI = {};
        swapchainCI.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
        swapchainCI.surface = surface_;
        uint32_t desiredNumberOfSwapchainImages = surfCaps_.minImageCount + 1;
        if ((surfCaps_.maxImageCount > 0) &&
            (desiredNumberOfSwapchainImages > surfCaps_.maxImageCount)) {
            desiredNumberOfSwapchainImages = surfCaps_.maxImageCount;
        }
        swapchainCI.minImageCount = desiredNumberOfSwapchainImages;
        swapchainCI.imageFormat = imageFormat;
        swapchainCI.imageColorSpace = imageColorSpace;
        uint32_t width = 1280;
        uint32_t height = 720;
        swapchainCI.imageExtent = { width, height };
        swapchainCI.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
        swapchainCI.preTransform = (VkSurfaceTransformFlagBitsKHR)VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;
        swapchainCI.imageArrayLayers = 1;
        swapchainCI.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
        swapchainCI.queueFamilyIndexCount = 0;
        swapchainCI.presentMode = VK_PRESENT_MODE_IMMEDIATE_KHR;
        swapchainCI.oldSwapchain = swapChain_;
        swapchainCI.clipped = VK_TRUE;
        swapchainCI.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;

        return swapchainCI;
}

OHNativeWindow* VulkanLoaderUnitTest::CreateNativeWindow(std::string name)
{
    struct RSSurfaceNodeConfig rsSurfaceNodeConfig;
    rsSurfaceNodeConfig.SurfaceNodeName = "createSurface_test";
    auto surfaceNode = RSSurfaceNode::Create(rsSurfaceNodeConfig, RSSurfaceNodeType::DEFAULT);
    OHOS::sptr<OHOS::Surface> surf = surfaceNode->GetSurface();
    OHNativeWindow* nativeWindow = CreateNativeWindowFromSurface(&surf);
    return nativeWindow;
}

uint32_t VulkanLoaderUnitTest::GetQueueFamilyIndex(VkQueueFlagBits queueFlags)
{
    decltype(queueProps_.size()) i = 0;
    if (queueFlags & VK_QUEUE_COMPUTE_BIT) {
        for (i = 0; i < queueProps_.size(); i++) {
            if ((queueProps_[i].queueFlags & queueFlags) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0)) {
                return i;
            }
        }
    }
    if (queueFlags & VK_QUEUE_TRANSFER_BIT) {
        for (i = 0; i < queueProps_.size(); i++) {
            if ((queueProps_[i].queueFlags & queueFlags) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0) &&
                ((queueProps_[i].queueFlags & VK_QUEUE_COMPUTE_BIT) == 0)) {
                return i;
            }
        }
    }
    for (i = 0; i < queueProps_.size(); i++) {
        if (queueProps_[i].queueFlags & queueFlags) {
            return i;
        }
    }
    std::cout << "Could not find a matching queue family index" << std::endl;
    return -1;
}

VkBool32 VulkanLoaderUnitTest::UserCallback(
    VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity,
    VkDebugUtilsMessageTypeFlagsEXT messageType,
    const VkDebugUtilsMessengerCallbackDataEXT* pCallbackData,
    void* pUserData)
{
    std::string prefix("");
    if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) {
        prefix = "ERROR: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT) {
        prefix = "WARN: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT) {
        prefix = "INFO: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT) {
        prefix = "DEBUG: ";
    }
    debugMessage_ << prefix << "[" << pCallbackData->messageIdNumber << "]["
        << pCallbackData->pMessageIdName << "] : " << pCallbackData->pMessage;
    return VK_FALSE;
}

void VulkanLoaderUnitTest::TearDownTestCase()
{
    if (device_ != nullptr) {
        if (swapChain_ != VK_NULL_HANDLE) {
            fpDestroySwapchainKHR(device_, swapChain_, nullptr);
        }
        vkDestroyDevice(device_, nullptr);
    }
    if (instance_ != nullptr) {
        if (surface_ != VK_NULL_HANDLE) {
            vkDestroySurfaceKHR(instance_, surface_, nullptr);
        }
        vkDestroyInstance(instance_, nullptr);
    }
}

/**
 * @tc.name   LoadBaseFuncPtr
 * @tc.number LoadBaseFuncPtr
 * @tc.desc   Load base Vulkan functions
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, LoadBaseFuncPtr, Function | MediumTest | Level1)
{
    bool opened = DLOpenLibVulkan();
    std::cout << "LibVulkan opened: " << opened << std::endl;
    std::cout << "libVulkan_ ptr: " << libVulkan_ << std::endl;
    if (opened && libVulkan_ != nullptr) {
        // Load base functions
        vkEnumerateInstanceExtensionProperties = reinterpret_cast<PFN_vkEnumerateInstanceExtensionProperties>(
            dlsym(libVulkan_, "vkEnumerateInstanceExtensionProperties"));
        EXPECT_NE(vkEnumerateInstanceExtensionProperties, nullptr);
        vkEnumerateInstanceLayerProperties = reinterpret_cast<PFN_vkEnumerateInstanceLayerProperties>(
            dlsym(libVulkan_, "vkEnumerateInstanceLayerProperties"));
        EXPECT_NE(vkEnumerateInstanceLayerProperties, nullptr);
        vkEnumerateDeviceExtensionProperties = reinterpret_cast<PFN_vkEnumerateDeviceExtensionProperties>(
            dlsym(libVulkan_, "vkEnumerateDeviceExtensionProperties"));
        EXPECT_NE(vkEnumerateDeviceExtensionProperties, nullptr);
        vkEnumerateDeviceLayerProperties = reinterpret_cast<PFN_vkEnumerateDeviceLayerProperties>(
            dlsym(libVulkan_, "vkEnumerateDeviceLayerProperties"));
        EXPECT_NE(vkEnumerateDeviceLayerProperties, nullptr);
        vkCreateInstance = reinterpret_cast<PFN_vkCreateInstance>(dlsym(libVulkan_, "vkCreateInstance"));
        EXPECT_NE(vkCreateInstance, nullptr);
        vkGetInstanceProcAddr = reinterpret_cast<PFN_vkGetInstanceProcAddr>(dlsym(libVulkan_, "vkGetInstanceProcAddr"));
        EXPECT_NE(vkGetInstanceProcAddr, nullptr);
        vkGetDeviceProcAddr = reinterpret_cast<PFN_vkGetDeviceProcAddr>(dlsym(libVulkan_, "vkGetDeviceProcAddr"));
        EXPECT_NE(vkGetDeviceProcAddr, nullptr);
        TrytoCreateVkInstance();
    }
}

/**
 * @tc.name   LoadInstanceFuncPtr
 * @tc.number LoadInstanceFuncPtr
 * @tc.desc   load instance based function pointer
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, LoadInstanceFuncPtr, Function | MediumTest | Level1)
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (isSupportedVulkan_) {
        std::cout << "instance_ ptr: " << instance_ << std::endl;
        ASSERT_NE(instance_, nullptr);
        vkDestroyInstance = reinterpret_cast<PFN_vkDestroyInstance>(
            vkGetInstanceProcAddr(instance_, "vkDestroyInstance"));
        EXPECT_NE(vkDestroyInstance, nullptr);
        vkEnumeratePhysicalDevices = reinterpret_cast<PFN_vkEnumeratePhysicalDevices>(
            vkGetInstanceProcAddr(instance_, "vkEnumeratePhysicalDevices"));
        EXPECT_NE(vkEnumeratePhysicalDevices, nullptr);
        vkCreateDevice = reinterpret_cast<PFN_vkCreateDevice>(vkGetInstanceProcAddr(instance_, "vkCreateDevice"));
        EXPECT_NE(vkCreateDevice, nullptr);
        vkDestroyDevice = reinterpret_cast<PFN_vkDestroyDevice>(vkGetInstanceProcAddr(instance_, "vkDestroyDevice"));
        EXPECT_NE(vkDestroyDevice, nullptr);
        vkDestroySurfaceKHR = reinterpret_cast<PFN_vkDestroySurfaceKHR>(
            vkGetInstanceProcAddr(instance_, "vkDestroySurfaceKHR"));
        EXPECT_NE(vkDestroySurfaceKHR, nullptr);

        vkCreateSurfaceOHOS = reinterpret_cast<PFN_vkCreateSurfaceOHOS>(
            vkGetInstanceProcAddr(instance_, "vkCreateSurfaceOHOS"));
        EXPECT_NE(vkCreateSurfaceOHOS, nullptr);

        fpGetPhysicalDeviceSurfaceCapabilitiesKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"));
        EXPECT_NE(fpGetPhysicalDeviceSurfaceCapabilitiesKHR, nullptr);
        fpGetPhysicalDeviceSurfacePresentModesKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfacePresentModesKHR>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfacePresentModesKHR"));
        EXPECT_NE(fpGetPhysicalDeviceSurfacePresentModesKHR, nullptr);
        fpGetPhysicalDeviceSurfaceFormatsKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceFormatsKHR>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceFormatsKHR"));
        EXPECT_NE(fpGetPhysicalDeviceSurfaceFormatsKHR, nullptr);
        vkGetPhysicalDeviceQueueFamilyProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceQueueFamilyProperties>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceQueueFamilyProperties"));
        EXPECT_NE(vkGetPhysicalDeviceQueueFamilyProperties, nullptr);
        vkGetPhysicalDeviceProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceProperties"));
        EXPECT_NE(vkGetPhysicalDeviceProperties, nullptr);
        vkGetPhysicalDeviceFeatures = reinterpret_cast<PFN_vkGetPhysicalDeviceFeatures>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceFeatures"));
        EXPECT_NE(vkGetPhysicalDeviceFeatures, nullptr);
        vkGetPhysicalDeviceMemoryProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceMemoryProperties>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceMemoryProperties"));
        EXPECT_NE(vkGetPhysicalDeviceMemoryProperties, nullptr);
        vkGetPhysicalDeviceSurfaceSupportKHR = reinterpret_cast<PFN_vkGetPhysicalDeviceSurfaceSupportKHR>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceSurfaceSupportKHR"));
        EXPECT_NE(vkGetPhysicalDeviceSurfaceSupportKHR, nullptr);
        vkCreateDebugUtilsMessengerEXT = reinterpret_cast<PFN_vkCreateDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(instance_, "vkCreateDebugUtilsMessengerEXT"));
        EXPECT_NE(vkCreateDebugUtilsMessengerEXT, nullptr);
        vkDestroyDebugUtilsMessengerEXT = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(instance_, "vkDestroyDebugUtilsMessengerEXT"));
        EXPECT_NE(vkDestroyDebugUtilsMessengerEXT, nullptr);
    }
}

/**
 * @tc.name   vkEnumeratePhysicalDevices_Test
 * @tc.number vkEnumeratePhysicalDevices_Test
 * @tc.desc   test vkEnumeratePhysicalDevices
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, vkEnumeratePhysicalDevices_Test, Function | MediumTest | Level1)
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (isSupportedVulkan_) {
        std::cout << "instance_ ptr: " << instance_ << std::endl;
        ASSERT_NE(instance_, nullptr);

        uint32_t gpuCount = 0;
        VkResult err = vkEnumeratePhysicalDevices(instance_, &gpuCount, nullptr);
        EXPECT_EQ(err, VK_SUCCESS);
        EXPECT_NE(gpuCount, 0);
        std::vector<VkPhysicalDevice> physicalDevices(gpuCount);
        err = vkEnumeratePhysicalDevices(instance_, &gpuCount, physicalDevices.data());
        EXPECT_EQ(err, VK_SUCCESS);
        physicalDevice_ = physicalDevices[0];
        EXPECT_NE(physicalDevice_, nullptr);

        VkPhysicalDeviceProperties deviceProperties;
        VkPhysicalDeviceFeatures deviceFeatures;
        VkPhysicalDeviceMemoryProperties deviceMemoryProperties;
        vkGetPhysicalDeviceProperties(physicalDevice_, &deviceProperties);
        vkGetPhysicalDeviceFeatures(physicalDevice_, &deviceFeatures);
        vkGetPhysicalDeviceMemoryProperties(physicalDevice_, &deviceMemoryProperties);
    }
}

/**
 * @tc.name   vkCreateDevice_Test
 * @tc.number vkCreateDevice_Test
 * @tc.desc   test vkCreateDevice
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, vkCreateDevice_Test, Function | MediumTest | Level1)
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (isSupportedVulkan_) {
        std::cout << "vkCreateDevice ptr: " << vkCreateDevice << std::endl;
        EXPECT_NE(vkCreateDevice, nullptr);
        std::cout << "physicalDevice_ ptr: " << physicalDevice_ << std::endl;
        EXPECT_NE(physicalDevice_, nullptr);

        VkDeviceCreateInfo deviceCreateInfo = {};
        deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

        std::vector<VkDeviceQueueCreateInfo> queueCreateInfos{};
        const float defaultQueuePriority(0.0f);
        VkDeviceQueueCreateInfo queueInfo{};
        queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
        queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
        queueInfo.queueCount = 1;
        queueInfo.pQueuePriorities = &defaultQueuePriority;
        queueCreateInfos.push_back(queueInfo);
        deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
        deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();

        std::vector<const char*> deviceExtensions;
        deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
        deviceCreateInfo.enabledExtensionCount = (uint32_t)deviceExtensions.size();
        deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();
        VkDevice logicalDevice;
        VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
        std::cout << "vkCreateDevice err: " << err << std::endl;
        EXPECT_EQ(err, VK_SUCCESS);
        std::cout << "logicalDevice ptr: " << logicalDevice << std::endl;
        EXPECT_NE(logicalDevice, nullptr);
        device_ = logicalDevice;
    }
}

/**
 * @tc.name   getNativeBufferPropertiesOHOS_Test
 * @tc.number getNativeBufferPropertiesOHOS_Test
 * @tc.desc   test vkCreateDevice
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, getNativeBufferPropertiesOHOS_Test, Function | MediumTest | Level1)
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (isSupportedVulkan_) {
        std::cout << "vkCreateDevice ptr: " << vkCreateDevice << std::endl;
        EXPECT_NE(vkCreateDevice, nullptr);
        std::cout << "physicalDevice_ ptr: " << physicalDevice_ << std::endl;
        EXPECT_NE(physicalDevice_, nullptr);
        VkDeviceCreateInfo deviceCreateInfo = {};
        deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

        std::vector<VkDeviceQueueCreateInfo> queueCreateInfos{};
        const float defaultQueuePriority(0.0f);
        VkDeviceQueueCreateInfo queueInfo{};
        queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
        queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
        queueInfo.queueCount = 1;
        queueInfo.pQueuePriorities = &defaultQueuePriority;
        queueCreateInfos.push_back(queueInfo);
        deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
        deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();

        std::vector<const char*> deviceExtensions;
        deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
        deviceCreateInfo.enabledExtensionCount = (uint32_t)deviceExtensions.size();
        deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();
        VkDevice logicalDevice;
        VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
        std::cout << "vkCreateDevice err: " << err << std::endl;
        EXPECT_EQ(err, VK_SUCCESS);
        std::cout << "logicalDevice ptr: " << logicalDevice << std::endl;
        EXPECT_NE(logicalDevice, nullptr);
        device_ = logicalDevice;

        OH_NativeBuffer *aHardBuffer = {};
        VkNativeBufferPropertiesOHOS androidHardwareBufferPropertiesOHOS = {};
        VkNativeBufferFormatPropertiesOHOS nativeBufferFormatPropertiesOHOS = {};
        nativeBufferFormatPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
        nativeBufferFormatPropertiesOHOS.pNext = nullptr;
        androidHardwareBufferPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
        androidHardwareBufferPropertiesOHOS.pNext = &nativeBufferFormatPropertiesOHOS;
        fpGetNativeBufferPropertiesOHOS = reinterpret_cast<PFN_vkGetNativeBufferPropertiesOHOS>(
            vkGetDeviceProcAddr(device_, "vkGetNativeBufferPropertiesOHOS"));
        fpGetNativeBufferPropertiesOHOS(device_, aHardBuffer, &androidHardwareBufferPropertiesOHOS);
    }
}

/**
 * @tc.name   getMemoryNativeBufferOHOS_Test
 * @tc.number getMemoryNativeBufferOHOS_Test
 * @tc.desc   test vkCreateDevice
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(VulkanLoaderUnitTest, getMemoryNativeBufferOHOS_Test, Function | MediumTest | Level1)
{
    std::cout << "isSupportedVulkan_: " << isSupportedVulkan_ << std::endl;
    if (isSupportedVulkan_) {
        std::cout << "vkCreateDevice ptr: " << vkCreateDevice << std::endl;
        EXPECT_NE(vkCreateDevice, nullptr);
        std::cout << "physicalDevice_ ptr: " << physicalDevice_ << std::endl;
        EXPECT_NE(physicalDevice_, nullptr);
        VkDeviceCreateInfo deviceCreateInfo = {};
        deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

        std::vector<VkDeviceQueueCreateInfo> queueCreateInfos{};
        const float defaultQueuePriority(0.0f);
        VkDeviceQueueCreateInfo queueInfo{};
        queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
        queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
        queueInfo.queueCount = 1;
        queueInfo.pQueuePriorities = &defaultQueuePriority;
        queueCreateInfos.push_back(queueInfo);
        deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
        deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();

        std::vector<const char*> deviceExtensions;
        deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
        deviceCreateInfo.enabledExtensionCount = (uint32_t)deviceExtensions.size();
        deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();
        VkDevice logicalDevice;
        VkResult err = vkCreateDevice(physicalDevice_, &deviceCreateInfo, nullptr, &logicalDevice);
        std::cout << "vkCreateDevice err: " << err << std::endl;
        EXPECT_EQ(err, VK_SUCCESS);
        std::cout << "logicalDevice ptr: " << logicalDevice << std::endl;
        EXPECT_NE(logicalDevice, nullptr);
        device_ = logicalDevice;

        OH_NativeBuffer *aHardBuffer = {};
        VkDeviceMemory handwareBufferMemory = {};
        VkMemoryGetNativeBufferInfoOHOS getAndroidHardwareBufferInfoOHOS;
        getAndroidHardwareBufferInfoOHOS.sType = VK_STRUCTURE_TYPE_MEMORY_GET_NATIVE_BUFFER_INFO_OHOS;
        getAndroidHardwareBufferInfoOHOS.pNext = nullptr;
        getAndroidHardwareBufferInfoOHOS.memory = handwareBufferMemory;
        fpGetMemoryNativeBufferOHOS = reinterpret_cast<PFN_vkGetMemoryNativeBufferOHOS>(
            vkGetDeviceProcAddr(device_, "vkGetMemoryNativeBufferOHOS"));
        fpGetMemoryNativeBufferOHOS(device_, &getAndroidHardwareBufferInfoOHOS, &aHardBuffer);
    }
}
} // vulkan::loader
