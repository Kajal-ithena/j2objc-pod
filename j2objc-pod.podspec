Pod::Spec.new do |s|
    s.name             = 'j2objc-pod'
    s.version          = '2.7'
    s.summary          = 'Integrates the pre-built J2ObjC frameworks into your project.'
    s.description      = <<-DESC
    Downloads the j2objc release and integrates the frameworks into your project.
                         DESC
  
    s.homepage         = 'https://github.com/shim007/j2objc-pod'
    s.license          = 'private'
    s.author           = { 'Corey-Pett' => 'coreyallenpett@gmail.com' }
    s.source           = { :git => 'https://github.com/shim007/j2objc-pod.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '10.0'
    s.requires_arc = false

    s.prepare_command = <<-CMD
        scripts/download.sh
    CMD

    s.preserve_paths = 'j2objc_lib/**/*'
    s.public_header_files = 'j2objc_lib/include/**/*.h'
    s.source_files = 'j2objc_lib/include/**/*.h'
    s.header_mappings_dir = 'j2objc_lib/include'
  
    s.libraries = 'jre_emul', 'icucore', 'z', 'iconv'
    s.vendored_libraries = 'j2objc_lib/lib/libjre_emul.a', 'j2objc_lib/lib/libjavax_inject.a'
  
    s.xcconfig = { 
        'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/j2objc_lib/include"'
     }
  
  end