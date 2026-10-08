SELECT DISTINCT ON (student_id)
    student_id,
    exam_id,
    score
FROM exam_results
ORDER BY student_id, score DESC, exam_id;

--this approach can be used to get the 1st row of dstinct values ;  order by will order rows, all similar ones wil be together, and this approach will pick the 1st entry from each group.
