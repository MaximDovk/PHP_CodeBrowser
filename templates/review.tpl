<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>
            Mayflower Code Browser - Source Code
        </title>
        <link rel="stylesheet" type="text/css" href="<?php print $csspath; ?>js/jquery.sidebar/css/codebrowser/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="<?php print $csspath; ?>css/cruisecontrol.css" />
        <link rel="stylesheet" type="text/css" href="<?php print $csspath; ?>css/review.css" />
        <link rel="stylesheet" type="text/css" href="<?php print $csspath; ?>css/tree.css" />
        
        <script type="text/javascript" src="<?php print $csspath; ?>js/review.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery-1.4.2.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.jstree/jquery.jstree.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.sidebar/jquery-ui-1.7.2.custom.min.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.sidebar/jquery.sidebar.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.cluetip/lib/jquery.hoverIntent.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.cluetip/lib/jquery.bgiframe.min.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/jquery.cluetip/jquery.cluetip.js"></script>
        <script type="text/javascript" src="<?php print $csspath; ?>js/tree.js"></script>
    </head>
    <body class="codebrowser">
        <div id="treeContainer">
            <div id="tree">
                <div id="treeHeader">
                    <a href="<?php print $csspath; ?>index.html">CodeBrowser</a>
                </div>
                <?php echo $treeList; ?>
            </div>
            <div id="treeToggle">
                <img src="<?php print $csspath; ?>img/treeToggle.gif">
            </div>
        </div>

        <div id="review">
            <div class="header">
                <a href="./<?php echo $csspath; ?>flatView.html">&larr; flat View</a> | <?php echo $title; ?>
            </div>
            <div class="filepath">
                <?php echo $filepath; ?>
            </div>

            <?php echo $source; ?>
            <?php if (!empty($issues)) : ?>

            <div id="sidebar">
                <table cellpadding="3">
                    <thead>
                        <tr>
                            <th width="40px" align="center">
                                <strong>start</strong>
                            </th>
                            <th width="40px" align="center">
                                <strong>end</strong>
                            </th>
                            <th>
                                <strong>comment</strong>
                            </th>
                            <th width="120px">
                                <strong>type of error</strong>
                            </th>
                            <th width="60px">
                                <strong>severity</strong>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($issues as $issue):?>
                        
                        <tr class="<?php print $issue->foundBy; ?>">
                            <td align="center">
                                <a href="#line_<?php print $issue->lineStart;?>" onClick="switchLine('line_<?php print $issue->lineStart;?>')">
                                <?php print $issue->lineStart; ?></a>
                            </td>
                            <td align="center">
                                <a href="#line_<?php print $issue->lineEnd;?>" onClick="switchLine('line_<?php print $issue->lineStart;?>')"
                                    onclick="new Effect.Highlight('line_<?php print $issue->lineStart."-".$issue->lineEnd; ?>', {duration: 1.5}); return false">
                                <?php print $issue->lineEnd;?></a>
                            </td>
                            <td>
                                <a href="#line_<?php print $issue->lineStart; ?>" onClick="switchLine('line_<?php print $issue->lineStart;?>')"
                                    onclick="new Effect.Highlight('line_<?php print $issue->lineStart."-".$issue->lineEnd; ?>', {duration: 1.5}); return false">
                                <?php print (string)$issue->description;?></a>
                            </td>
                            <td>
                                <?php print $issue->foundBy;?>
                            </td>
                            <td>
                                <?php print $issue->severity;?>
                            </td>
                        </tr>
                        <?php endforeach; //$issues as $issue ?>
                    </tbody>
                </table>
            </div>
            <script language="javascript">
                <?php
                    echo $jsCode;
                ?>
        
                $(function() {
                    $("div#sidebar").sidebar({width:600, height: 400, open : "click", close: "click", position: "right"});
                })
            </script> 
            <?php endif; // div sidebar ?> 
        </div>
    </body>
</html>
