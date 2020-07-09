use warnings;
use strict;
use lib "t";
use Test::More;
use Test::Builder::Tester;
use Module::Path 'module_path';

BEGIN {
    use_ok( 'Test::Pod::CoverageChange' );
    use_ok( 't::PodSyntaxError');
}

subtest 'Module with no pod, unexpected' => sub {
    my $test_module = "t::PodSyntaxError";
    my $test_module_path = 't/PodSyntaxError.pm';
    my $main_module_path = module_path('Test::Pod::CoverageChange');

    test_out("not ok 1 - Pod coverage on $test_module");
    test_out("not ok 2 - There are 1 errors in the POD structure in the t/PodSyntaxError.pm.");
    test_diag("  Failed test 'Pod coverage on t::PodSyntaxError'");
    test_diag("  at $main_module_path line 91.");
    test_diag("$test_module: requiring '$test_module' failed");
    test_diag("  Failed test 'There are 1 errors in the POD structure in the $test_module_path.'");
    test_diag("  at $main_module_path line 121.");
    Test::Pod::CoverageChange::check($test_module_path);
    test_test( "Handles files with no pod at all" );
};

done_testing();
